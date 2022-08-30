//
//  BrandListViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/24.
//

import UIKit
import Kingfisher

enum MyFollowing {
    case allBrand
    case followedBrand
}

enum BrandFilter: String {
    case KoreanFilter = "K"
    case EnglishFilter = "E"
}

class BrandListViewController: UIViewController {
    @IBOutlet weak var navigationBar: UIView!
    @IBOutlet weak var backgroundScrollView: UIScrollView!
    @IBOutlet weak var barTitleLabel: UILabel!
    @IBOutlet weak var largeTitleLabel: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var brandTableView: UITableView!
    @IBOutlet weak var myFollowingButton: UIButton!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var filterLabel: UILabel!
    
    
    let brandListDataManager = BrandListDataManager()
    var brandList: [BrandListResult] = []
    
    let followingBrandDataManager = FollowingBrandDataManager()
    var followingBrandList: [FollowingBrandResult] = []
    
    var myFollowing: MyFollowing = .allBrand
    var brandFilterValue = "K"
    var brandFilter: BrandFilter = .KoreanFilter
    var page = 1
    var check = true
    
//MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.setTableView()
        self.fetchAllBrandData()
    }
    
    
//MARK: - Private function
    
    private func configureView() {
        self.backgroundScrollView.delegate = self
        
        self.searchView.layer.cornerRadius = 5
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapFilterView))
        self.filterView.addGestureRecognizer(gesture)
        
        let searchTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapSearchView))
        self.searchView.addGestureRecognizer(searchTapGesture)
    }
    
    private func setTableView() {
        self.brandTableView.delegate = self
        self.brandTableView.dataSource = self
        self.brandTableView.register(UINib(nibName: "SimpleBrandTableViewCell", bundle: nil), forCellReuseIdentifier: "SimpleBrandTableViewCell")
    }
    
    private func fetchAllBrandData() {
        self.showIndicator()
        brandListDataManager.getData(sort: self.brandFilterValue, page: self.page) { response in
            self.brandList = response
            
            DispatchQueue.main.async {
                self.brandTableView.reloadData()
                self.dismissIndicator()
            }
        }
    }
    
    private func fetchFollowingBrandData() {
        self.showIndicator()
        followingBrandDataManager.getData(sort: self.brandFilterValue) { response in
            self.followingBrandList = response
            
            DispatchQueue.main.async {
                self.brandTableView.reloadData()
                self.dismissIndicator()
            }
        }
    }
    
//MARK: - objc function
    @objc func tapFilterView() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BrandFilterViewController") as! BrandFilterViewController
        vc.delegate = self
        vc.brandFilterCheck = self.brandFilter
        self.presentPanModal(vc)
    }
    
    @objc func tapSearchView() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BrandSearchViewController") as! BrandSearchViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
//MARK: - Action
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func tapMyFollowingButton(_ sender: UIButton) {
        if myFollowing == .allBrand { //all brand를 보여줄 때 클릭 -> 팔로잉 브랜드만 보여줌
            self.myFollowingButton.tintColor = .mainRedColor
            myFollowing = .followedBrand
            
            self.fetchFollowingBrandData()
        } else {
            self.myFollowingButton.tintColor = .lightGray
            myFollowing = .allBrand
        }
        
        DispatchQueue.main.async {
            self.brandTableView.reloadData()
        }
    }
    
    
}

//MARK: - Extension
extension BrandListViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == backgroundScrollView {
            if scrollView.contentOffset.y > 0 {
                self.barTitleLabel.isHidden = false
            } else if scrollView.contentOffset.y <= 0 {
                self.barTitleLabel.isHidden = true
            }
        }
    }
}

extension BrandListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if myFollowing == .allBrand {
            return self.brandList.count
        } else if myFollowing == .followedBrand {
            return self.followingBrandList.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.brandTableView.dequeueReusableCell(withIdentifier: "SimpleBrandTableViewCell", for: indexPath) as? SimpleBrandTableViewCell else {return UITableViewCell()}
        
        //all brand
        if myFollowing == .allBrand {
            //custom cell
            cell.brandImageView.kf.indicatorType = .activity
            let url = URL(string: self.brandList[indexPath.row].logo)
            cell.brandImageView.kf.setImage(with: url)
            cell.brandNameLabel.text = self.brandList[indexPath.row].brandName
            cell.brandEnglishNameLabel.text = self.brandList[indexPath.row].englishName
            cell.brandItemCountLabel.text = self.brandList[indexPath.row].itemCnt
            
            //follow button
            if self.brandList[indexPath.row].follow { //팔로우되어 있으면
                cell.brandFollowButton.followed()
                cell.checkFollow = .followed
            } else {
                cell.brandFollowButton.notFollow()
                cell.checkFollow = .notFollowed
            }
        } //following brand
        else if myFollowing == .followedBrand {
            cell.brandImageView.kf.indicatorType = .activity
            let url = URL(string: self.followingBrandList[indexPath.row].logo)
            cell.brandImageView.kf.setImage(with: url)
            
            cell.brandNameLabel.text = self.followingBrandList[indexPath.row].brandName
            cell.brandEnglishNameLabel.text = self.followingBrandList[indexPath.row].englishName
            cell.brandItemCountLabel.text = self.followingBrandList[indexPath.row].itemCnt
            
            cell.brandFollowButton.followed()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
}

extension BrandListViewController: BrandFilterViewDelegate {
    func sendBrandFilter(_ brandFilter: BrandFilter) {
        switch brandFilter {
        case .KoreanFilter:
            self.brandFilter = brandFilter
            self.brandFilterValue = brandFilter.rawValue
            self.filterLabel.text = "가나다순"
        case .EnglishFilter:
            self.brandFilter = brandFilter
            self.brandFilterValue = brandFilter.rawValue
            self.filterLabel.text = "ABC순"
        }
        
        self.fetchAllBrandData()
        self.fetchFollowingBrandData()
    }
}

