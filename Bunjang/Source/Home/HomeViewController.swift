//
//  HomeViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/20.
//

import UIKit
import ImageSlideshow


class HomeViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var indicatorBackground: UIView!
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var backgroundScrollView: UIScrollView!
    @IBOutlet weak var bannerImageView: ImageSlideshow!
    @IBOutlet weak var barbellButton: UIBarButtonItem!
    @IBOutlet weak var barMagnifyButton: UIBarButtonItem!
    @IBOutlet weak var barMenuButton: UIBarButtonItem!
    @IBOutlet weak var bannerPageView: UIView!
    @IBOutlet weak var pageNumberLabel: UILabel!
    
    var bannerImages = [ImageSource(image: UIImage(named: "Banner1")!), ImageSource(image: UIImage(named: "Banner2")!), ImageSource(image: UIImage(named: "Banner3")!), ImageSource(image: UIImage(named: "Banner4")!)]
    
    let categoryData = CategoryData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setCollectionView()
        self.configureView()
    }
    
    
    private func configureView() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .white
        backgroundScrollView.contentInsetAdjustmentBehavior = .never
        
        self.bannerImageView.pageIndicator = nil
        self.bannerImageView.setImageInputs(bannerImages)
        self.bannerImageView.contentScaleMode = .scaleAspectFill
        self.bannerImageView.slideshowInterval = 2
        self.bannerImageView.delegate = self
        
        self.backgroundScrollView.delegate = self
        
        self.bannerPageView.layer.cornerRadius = 5
    }
    
    
    private func setCollectionView() {
        self.categoryCollectionView.delegate = self
        self.categoryCollectionView.dataSource = self
        
        self.categoryCollectionView.contentInset = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
    
        self.categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell") 
        
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
        if collectionView == categoryCollectionView {
            return 14
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            guard let cell = self.categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell()}
            
            cell.imgView.image = UIImage(named: categoryData.homeCategory[indexPath.row].imageName)
            cell.categoryNameLabel.text = categoryData.homeCategory[indexPath.row].categoryName
            return cell
            
        }
        return UICollectionViewCell()
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == backgroundScrollView {
            
            //스크롤에 따라 navigation bar 아이템 색상 변경
            if scrollView.contentOffset.y <= 0 {
                self.barMenuButton.tintColor = .white
                self.barMagnifyButton.tintColor = .white
                self.barbellButton.tintColor = .white
            }
            else if scrollView.contentOffset.y > 0 {
                self.barMenuButton.tintColor = .black
                self.barMagnifyButton.tintColor = .black
                self.barbellButton.tintColor = .black
            }
        }
        
        if scrollView == categoryCollectionView {
     
        }
    }
}

extension HomeViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        //이미지가 변경될 때마다 배너 page label 변경
        self.pageNumberLabel.text = "\(page+1)"
    }
}
