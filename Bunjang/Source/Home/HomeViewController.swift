//
//  HomeViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/20.
//

import UIKit



class HomeViewController: UIViewController {
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var indicatorBackground: UIView!
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var backgroundScrollView: UIScrollView!
    
    let categoryData = CategoryData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        navigationController?.navigationBar.shadowImage = UIImage()
        backgroundScrollView.contentInsetAdjustmentBehavior = .never

        
        self.setCollectionView()
    }
    
    private func setCollectionView() {
        
        self.bannerCollectionView.delegate = self
        self.bannerCollectionView.dataSource = self
        
        self.categoryCollectionView.delegate = self
        self.categoryCollectionView.dataSource = self
        
        self.categoryCollectionView.contentInset = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
      
        self.bannerCollectionView.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerCollectionViewCell")
        
        self.categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell") 
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: self.bannerCollectionView.frame.height)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        bannerCollectionView.collectionViewLayout = flowLayout
        
        let secondFlowLayout = UICollectionViewFlowLayout()
        secondFlowLayout.scrollDirection = .horizontal
        secondFlowLayout.minimumInteritemSpacing = 15
        secondFlowLayout.minimumLineSpacing = 15
        let width = (UIScreen.main.bounds.width-90)/5
        secondFlowLayout.itemSize = CGSize(width: width, height: width)
        categoryCollectionView.collectionViewLayout = secondFlowLayout
        
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannerCollectionView {
            return 10
        }
        if collectionView == categoryCollectionView {
            return 14
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bannerCollectionView {
            guard let cell = self.bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell else {return UICollectionViewCell()}
            return cell
        }
        if collectionView == categoryCollectionView {
            guard let cell = self.categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell()}
            
            cell.imgView.image = UIImage(named: categoryData.homeCategory[indexPath.row].imageName)
            cell.categoryNameLabel.text = categoryData.homeCategory[indexPath.row].categoryName
            return cell
            
        }
        return UICollectionViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.backgroundScrollView {
            print("끝")
        }
    }
}
