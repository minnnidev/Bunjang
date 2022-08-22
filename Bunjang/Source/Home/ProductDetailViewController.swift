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
    @IBOutlet weak var quantityButtonView: UIButton!
    @IBOutlet weak var shippingFeeButtonView: UIButton!
    @IBOutlet weak var exchangeButtonView: UIButton!
    
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
        self.quantityButtonView.layer.cornerRadius = 3
        self.shippingFeeButtonView.layer.cornerRadius = 3
        self.exchangeButtonView.layer.cornerRadius = 3
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
