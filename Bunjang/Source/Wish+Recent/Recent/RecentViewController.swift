//
//  RecentViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import UIKit
import Kingfisher

class RecentViewController: UIViewController {
    @IBOutlet weak var recentCollectionView: UICollectionView!
    
    let recentItemDataManager = RecentItemDataManager()
    var recentList: [RecentItemResult] = []
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCollectionView()
        self.fetchData()
        
    }
    
    
//MARK: - private function
    
    private func setCollectionView() {
        self.recentCollectionView.delegate = self
        self.recentCollectionView.dataSource = self
        self.recentCollectionView.register(UINib(nibName: "RecentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RecentCollectionViewCell")
        self.recentCollectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let width = (UIScreen.main.bounds.width-30)/2
        flowLayout.minimumLineSpacing = 15
        flowLayout.itemSize = CGSize(width: width, height: 250)
        self.recentCollectionView.collectionViewLayout = flowLayout
        
    }
    
    private func fetchData() {
        //임의로 1로 지정
        recentItemDataManager.getData(userIdx: 1) { response in
            self.recentList = response
            
            
            DispatchQueue.main.async {
                self.recentCollectionView.reloadData()
            }
        }
    }

}

//MARK: - Extension
extension RecentViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.recentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.recentCollectionView.dequeueReusableCell(withReuseIdentifier: "RecentCollectionViewCell", for: indexPath) as? RecentCollectionViewCell else {return UICollectionViewCell()}
        
        //custom cell with data
        cell.itemNameLabel.text = self.recentList[indexPath.row].name
        cell.itemPriceLabel.text = self.recentList[indexPath.row].price
        
        let url = URL(string: self.recentList[indexPath.row].image)
        cell.itemImageView.kf.setImage(with: url)
        
        return cell
    }
    
}
