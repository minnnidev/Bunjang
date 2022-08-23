//
//  ProductDetailViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/21.
//

import UIKit

class ProductDetailViewController: UIViewController {
    @IBOutlet weak var cashBackBanner: UIView!
    @IBOutlet weak var bungaeTalkButton: UIButton!
    @IBOutlet weak var safePayButton: UIButton!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
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
    
    var result: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.setCollectionView()
    }
    
    private func configureView() {
        self.cashBackBanner.layer.borderColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1.0).cgColor
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
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: "SimpleProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SimpleProductCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let width = UIScreen.main.bounds.width-40
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 20
        flowLayout.itemSize = CGSize(width: (width-14)/3, height: 190)
        self.collectionView.collectionViewLayout = flowLayout
    }
}

extension ProductDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "SimpleProductCollectionViewCell", for: indexPath) as? SimpleProductCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
}
