//
//  TabFirstViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/20.
//

import UIKit

class TabFirstViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let itemDataManager = ItemDataManager()
    var data: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCollectionView()
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
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
