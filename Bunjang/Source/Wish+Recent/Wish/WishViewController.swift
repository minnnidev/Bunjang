//
//  WishViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import UIKit
import Kingfisher

class WishViewController: UIViewController {
    @IBOutlet weak var wishListCollectionView: UICollectionView!
    
    let wishListDataManager = WishListDataManager()
    var result: [WishListResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCollectionView()
        self.fetchData()
    }
    
//MARK: - private function
    private func setCollectionView() {
        self.wishListCollectionView.delegate = self
        self.wishListCollectionView.dataSource = self
        self.wishListCollectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        
        self.wishListCollectionView.register(UINib(nibName: "WishListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WishListCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 15
        let width = (UIScreen.main.bounds.width-30)/2
        flowLayout.itemSize = CGSize(width: width, height: 280)
        self.wishListCollectionView.collectionViewLayout = flowLayout
    }
    
    private func fetchData() {
        wishListDataManager.getData(page: 1) { response in
            self.result = response
            
            DispatchQueue.main.async {
                self.wishListCollectionView.reloadData()
            }
        }
    }
}



//MARK: - extension
extension WishViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = self.wishListCollectionView.dequeueReusableCell(withReuseIdentifier: "WishListCollectionViewCell", for: indexPath) as? WishListCollectionViewCell else {return UICollectionViewCell()}
        
        let url = URL(string: self.result[indexPath.row].image)
        cell.itemImageView.kf.setImage(with: url)
        
        let storeURL = URL(string: self.result[indexPath.row].storeImg)
        cell.storeImageView.kf.setImage(with: storeURL)
        
        cell.itemNameLabel.text = self.result[indexPath.row].name
        cell.itemPriceLabel.text = self.result[indexPath.row].price
        cell.storeNameLabel.text = self.result[indexPath.row].storeName
        cell.dataLabel.text = self.result[indexPath.row].updatedAt

        
        return cell
    }
}
