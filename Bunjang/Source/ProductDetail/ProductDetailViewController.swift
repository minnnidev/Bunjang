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
    @IBOutlet weak var imageSlideView: ImageSlideshow!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var imagePageView: UIView!
    @IBOutlet weak var currentPageLabel: UILabel!
    @IBOutlet weak var pageNumberLabel: UILabel!
    
    @IBOutlet weak var bungaeTalkButton: UIButton!
    @IBOutlet weak var safePayButton: UIButton!
    @IBOutlet weak var viewAllProductButton: UIButton!
    @IBOutlet weak var viewAllReviewButton: UIButton!
    @IBOutlet weak var viewInquiryButton: UIButton!
    @IBOutlet weak var isOldButtonView: UIButton!
    @IBOutlet weak var stockButtonView: UIButton!
    @IBOutlet weak var shippingFeeButtonView: UIButton!
    @IBOutlet weak var exchangeButtonView: UIButton!
    @IBOutlet weak var followButton: UIButton!
    
    //item
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hitLabel: UILabel!
    @IBOutlet weak var wishLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var contentView: UITextView!
    
    //collectionView
    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var storeProductCollectionView: UICollectionView!
    @IBOutlet weak var reviewCollectionView: UICollectionView!
    
    //store
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var isCertificatedLabel: UILabel!
    @IBOutlet weak var starRatingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var storeCountLabel: UILabel!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var storeView: UIView!
    
    
    var tagList: [String] = []
    var imageSlide: [ImageSource] = []
    var itemResult: EachItemResult?
    
    let eachItemDataManager = EachItemDataManager()
    let viewStoreDataManager = ViewStoreDataManager()
    var storeResult: ViewStoreResponse?
    var itemsResult: [ItemsResponse] = []
    var reviewResult: [ReviewsResponse] = []
    
    var itemIdx: String?
    var userIdx: String?
    var seller: String?


//MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.setCollectionView()
        self.fetchItemData()
        self.fetchStoreData()

    }

//MARK: - private function
    private func fetchStoreData() {
        guard let userIdx = self.userIdx else {return}
        viewStoreDataManager.getData(userIdx: userIdx) { response in
            self.storeNameLabel.text = response.storeName
            self.starRatingLabel.text = response.rating
            self.followersLabel.text = response.followers
            
            let url = URL(string: response.storeImage)
            self.storeImageView.kf.setImage(with: url)
            
            //본인인증 x라면 text 변경
            if !response.isCertificated {
                self.isCertificatedLabel.text = "본인인증x"
            }
            
            self.itemsResult = response.itemsResponses
            self.reviewResult = response.reviewsResponses
            self.storeCountLabel.text = String(self.itemsResult.count)
            self.reviewCountLabel.text = String(self.reviewResult.count)
            
            
            DispatchQueue.main.async {
                self.storeProductCollectionView.reloadData()
                self.reviewCollectionView.reloadData()
                
            }
        }
    }
    
    private func fetchItemData() {
        guard let itemIdx = self.itemIdx else {return}
        
        eachItemDataManager.getData(itemIdx: itemIdx) { response in
            self.itemResult = response.result
            
            self.priceLabel.text = response.result.price
            self.itemNameLabel.text = response.result.name
            self.locationLabel.text = response.result.location
            self.dateLabel.text = response.result.time
            self.hitLabel.text = response.result.hit
            self.wishLabel.text = response.result.wish
            self.chatLabel.text = response.result.chat
            self.contentView.text = response.result.content
            
            self.seller = response.result.seller
            
            //수량
            let stock = response.result.stock
            self.stockButtonView.setTitle("총 \(stock)개", for: .normal)
            
            //중고 or new
            if response.result.new {
                self.isOldButtonView.setTitle("새상품", for: .normal)
            }
            
            //배송비포함 or 배송비 별도
            if response.result.delivery {
                self.shippingFeeButtonView.setTitle("배송비포함", for: .normal)
            }
            
            //교환가능 or 교환 불가
            if response.result.exchange {
                self.exchangeButtonView.setTitle("교환가능", for: .normal)
            }
            
            //tag
            self.tagList = response.result.tags
            
            //이미지 넣기
            for i in 0..<response.result.images.count {
                let url = URL(string: response.result.images[i])
                let data = try? Data(contentsOf: url!)
                self.imageSlide.append(ImageSource(image: UIImage(data:data!)!))
            }
            
            self.imageSlideView.setImageInputs(self.imageSlide)
            self.imageSlideView.contentScaleMode = .scaleAspectFill
            
            //이미지 label indicator
            self.imageSlideView.pageIndicator = nil
            self.imageSlideView.delegate = self
            self.pageNumberLabel.text = String(self.imageSlide.count)

            
            DispatchQueue.main.async {
                self.storeProductCollectionView.reloadData()
                self.tagCollectionView.reloadData()
            }
       }
    }

    
    private func configureView() {
        //배너
        self.bannerView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.bannerView.layer.borderWidth = 1
        self.bannerView.layer.cornerRadius = 5
        
        self.followButton.layer.cornerRadius = 5
        
        self.bungaeTalkButton.layer.cornerRadius = 8
        self.safePayButton.layer.cornerRadius = 8
        
        self.storeImageView.layer.cornerRadius = self.storeImageView.frame.width/2
        
        self.viewAllProductButton.layer.cornerRadius = 5
        self.viewAllReviewButton.layer.cornerRadius = 5
        self.viewInquiryButton.setUnderline() //밑줄
        
        //중고 - 수량 - 배송비 - 교환
        self.isOldButtonView.layer.cornerRadius = 3
        self.stockButtonView.layer.cornerRadius = 3
        self.shippingFeeButtonView.layer.cornerRadius = 3
        self.exchangeButtonView.layer.cornerRadius = 3
        
        //page indicator custom
        self.imagePageView.layer.cornerRadius = 5
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapStoreView))
        self.storeView.addGestureRecognizer(gesture)
    }
    
    private func setCollectionView() {
        //storeProductCollectionView
        self.storeProductCollectionView.delegate = self
        self.storeProductCollectionView.dataSource = self
        
        self.storeProductCollectionView.register(UINib(nibName: "SimpleProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SimpleProductCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 20
        self.storeProductCollectionView.collectionViewLayout = flowLayout
        
        
        //tagCollectionView
        self.tagCollectionView.delegate = self
        self.tagCollectionView.dataSource = self
        self.tagCollectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagCollectionViewCell")
        
        //review CollectionView
        self.reviewCollectionView.delegate = self
        self.reviewCollectionView.dataSource = self
        self.reviewCollectionView.register(UINib(nibName: "ReviewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReviewCollectionViewCell")
        
        let reviewFlowLayout = UICollectionViewFlowLayout()
        reviewFlowLayout.scrollDirection = .vertical
        self.reviewCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.reviewCollectionView.collectionViewLayout = reviewFlowLayout
       
    }
    
//MARK: - objc function
    @objc func tapStoreView() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewStoreController") as! ViewStoreController
        vc.seller = self.seller
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

//MARK: - Extension - CollectionView
extension ProductDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            case storeProductCollectionView:
                return self.itemsResult.count
            case tagCollectionView:
                return self.tagList.count
            case reviewCollectionView:
                return self.reviewResult.count
            default:
                return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case storeProductCollectionView:
                guard let cell = self.storeProductCollectionView.dequeueReusableCell(withReuseIdentifier: "SimpleProductCollectionViewCell", for: indexPath) as? SimpleProductCollectionViewCell else {return UICollectionViewCell()}
            
                cell.nameLabel.text = self.itemsResult[indexPath.row].itemName
                cell.priceLabel.text = self.itemsResult[indexPath.row].price
                
                let url = URL(string: self.itemsResult[indexPath.row].image)
                cell.imgView.kf.setImage(with: url)
            
                return cell
            
            case tagCollectionView:
                guard let cell = self.tagCollectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as? TagCollectionViewCell else {return UICollectionViewCell()}
            
                cell.tagLabel.text = self.tagList[indexPath.row]
                return cell
            case reviewCollectionView:
                guard let cell = self.reviewCollectionView.dequeueReusableCell(withReuseIdentifier: "ReviewCollectionViewCell", for: indexPath) as? ReviewCollectionViewCell else {return UICollectionViewCell()}
            

                cell.reviewerNameLabel.text = self.reviewResult[indexPath.row].reviewerName
                cell.starRateLabel.text = self.reviewResult[indexPath.row].rating
                cell.reviewContentLabel.text = self.reviewResult[indexPath.row].post
                cell.timeLabel.text = self.reviewResult[indexPath.row].date
            
                return cell
            default:
                return UICollectionViewCell()
        }
    }
}

extension ProductDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        switch collectionView {
            case storeProductCollectionView:
                let width = UIScreen.main.bounds.width-40
                return CGSize(width: (width-14)/3, height: 190)
            
            case tagCollectionView:
                let label = UILabel(frame: CGRect.zero)
                label.text = tagList[indexPath.item]
                label.sizeToFit()
                return CGSize(width: label.frame.width + 13, height: 30)
            
            case reviewCollectionView:
                let width = self.reviewCollectionView.frame.width
                return CGSize(width: width, height: 110)
            
            default:
                return CGSize()
        }
    }
}

//MARK: - Extension - ImageSlideShowDelegate
extension ProductDetailViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        //이미지가 변경될 때마다 배너 page label 변경
        self.currentPageLabel.text = "\(page+1)"
    }
}
