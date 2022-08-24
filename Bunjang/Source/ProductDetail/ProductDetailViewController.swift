//
//  ProductDetailViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/21.
//

import UIKit
import ImageSlideshow
import Kingfisher
import PanModal

class ProductDetailViewController: UIViewController {
    @IBOutlet weak var cashBackBanner: UIView!
    @IBOutlet weak var bungaeTalkButton: UIButton!
    @IBOutlet weak var safePayButton: UIButton!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var storeProductCollectionView: UICollectionView!
    @IBOutlet weak var viewAllProductButton: UIButton!
    @IBOutlet weak var viewInquiryButton: UIButton!
    @IBOutlet weak var isOldButtonView: UIButton!
    @IBOutlet weak var stockButtonView: UIButton!
    @IBOutlet weak var shippingFeeButtonView: UIButton!
    @IBOutlet weak var exchangeButtonView: UIButton!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hitLabel: UILabel!
    @IBOutlet weak var wishLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var contentView: UITextView!
    
    @IBOutlet weak var imageSlideView: ImageSlideshow!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    
    @IBOutlet weak var imagePageView: UIView!
    @IBOutlet weak var currentPageLabel: UILabel!
    @IBOutlet weak var pageNumberLabel: UILabel!
    
    var result: Result?
    var tagList: [String] = []
    var imageSlide: [ImageSource] = []
    
 
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.setCollectionView()
        self.fetchData()
    }
    
//MARK: - Private function
    private func configureView() {
        self.cashBackBanner.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.cashBackBanner.layer.borderWidth = 1
        self.cashBackBanner.layer.cornerRadius = 8
        
        self.bungaeTalkButton.layer.cornerRadius = 8
        self.safePayButton.layer.cornerRadius = 8
        
        self.followButton.layer.cornerRadius = 5
        
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width/2
        
        self.viewAllProductButton.layer.cornerRadius = 5
        
        self.viewInquiryButton.setUnderline() //밑줄
        
        //중고 - 수량 - 배송비 - 교환
        self.isOldButtonView.layer.cornerRadius = 3
        self.stockButtonView.layer.cornerRadius = 3
        self.shippingFeeButtonView.layer.cornerRadius = 3
        self.exchangeButtonView.layer.cornerRadius = 3
        
        //page indicator custom
        self.imagePageView.layer.cornerRadius = 5
    }
    
    private func fetchData() {
        //데이터 받아오기
        guard let result = self.result else {return}
        
        self.priceLabel.text = result.price
        self.itemNameLabel.text = result.name
        self.locationLabel.text = result.location
        self.dateLabel.text = result.time
        self.hitLabel.text = result.hit
        self.wishLabel.text = result.wish
        self.chatLabel.text = result.chat
        self.contentView.text = result.content
        
        //tag
        self.tagList = result.tags

        //이미지 넣기
        for i in 0..<result.images.count {
            let url = URL(string: result.images[i])
            let data = try? Data(contentsOf: url!)
            self.imageSlide.append(ImageSource(image: UIImage(data:data!)!))
        }
        
        self.imageSlideView.setImageInputs(self.imageSlide)
        self.imageSlideView.contentScaleMode = .scaleAspectFill
        
        //이미지 label indicator
        self.imageSlideView.pageIndicator = nil
        self.imageSlideView.delegate = self
        self.pageNumberLabel.text = String(self.imageSlide.count)
        
        
        //수량
        let stock = result.stock
        self.stockButtonView.setTitle("총 \(stock)개", for: .normal)
        
        //중고 or new
        if result.new {
            isOldButtonView.setTitle("새상품", for: .normal)
        }
        
        //배송비포함 or 배송비 별도
        if result.delivery {
            shippingFeeButtonView.setTitle("배송비포함", for: .normal)
        }
        
        //교환가능 or 교환 불가
        if result.exchange {
            exchangeButtonView.setTitle("교환가능", for: .normal)
        }
    }
    
    private func setCollectionView() {
        self.storeProductCollectionView.delegate = self
        self.storeProductCollectionView.dataSource = self
        
        self.storeProductCollectionView.register(UINib(nibName: "SimpleProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SimpleProductCollectionViewCell")
    
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 20
        self.storeProductCollectionView.collectionViewLayout = flowLayout
        
        self.tagCollectionView.delegate = self
        self.tagCollectionView.dataSource = self
        
        self.tagCollectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagCollectionViewCell")
    }
    
//MARK: - Action
    @IBAction func safePayButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TransactionOptionViewController") as! TransactionOptionViewController
        self.presentPanModal(vc)
    }
}

//MARK: - Extension: UICollectionView Delegate & DataSource
extension ProductDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == storeProductCollectionView {
            return 6
        }
        
        if collectionView == tagCollectionView {
            return self.tagList.count
        }
        
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == storeProductCollectionView {
            guard let cell = self.storeProductCollectionView.dequeueReusableCell(withReuseIdentifier: "SimpleProductCollectionViewCell", for: indexPath) as? SimpleProductCollectionViewCell else {return UICollectionViewCell()}
            return cell
        }
        
        if collectionView == tagCollectionView {
            guard let cell = self.tagCollectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as? TagCollectionViewCell else {return UICollectionViewCell()}
            cell.tagLabel.text = self.tagList[indexPath.row]
            return cell
        }
        
        return UICollectionViewCell()
    }
}

//MARK: - Extension: UICollectionViewDelegateFlowLayout
extension ProductDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == tagCollectionView {
            let label = UILabel(frame: CGRect.zero)
            label.text = tagList[indexPath.item]
            label.sizeToFit()

            return CGSize(width: label.frame.width + 13, height: 30)
        }
        
        if collectionView == storeProductCollectionView {
            let width = UIScreen.main.bounds.width-40
            
            return CGSize(width: (width-14)/3, height: 190)
        }
        
        return CGSize()
    }
}

//MARK: - Extension: ImageSlideshowDelegate
extension ProductDetailViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        //이미지가 변경될 때마다 배너 page label 변경
        self.currentPageLabel.text = "\(page+1)"
    }
}
