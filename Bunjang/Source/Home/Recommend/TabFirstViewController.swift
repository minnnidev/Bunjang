//
//  TabFirstViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/20.
//

import UIKit
import Kingfisher

class TabFirstViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let viewItemDataManager = ViewItemDataManager()
    var result: [Result] = []


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCollectionView()
        
        self.fetchData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.fetchData()
    }
    
    private func fetchData() {
        viewItemDataManager.sendData { response in
            self.result = response
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    
    private func setCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        
        self.collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let width = (UIScreen.main.bounds.width-40)/2
        flowLayout.itemSize = CGSize(width: width, height: 380)
        self.collectionView.collectionViewLayout = flowLayout
    }

}

extension TabFirstViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell else {return UICollectionViewCell()}
        
    
        let data = self.result[indexPath.row]
        let url = URL(string: data.images[0])
        
        cell.imgView.kf.indicatorType = .activity
        cell.imgView.kf.setImage(with: url)
        
        
        cell.priceLabel.text = data.price
        cell.itemNameLabel.text = data.name
        cell.locationLabel.text = data.location
        cell.dateLabel.text = data.time
        cell.wishNumberLabel.text = data.wish
        
        if data.wish == "0" {
            cell.heartView.isHidden = true
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController else {return}
        
        //vc.result = self.result[indexPath.row]
        vc.itemIdx = self.result[indexPath.row].idx
        vc.userIdx = self.result[indexPath.row].seller
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
