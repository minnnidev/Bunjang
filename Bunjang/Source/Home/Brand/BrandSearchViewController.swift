//
//  BrandSearchViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import UIKit
import Kingfisher

class BrandSearchViewController: UIViewController {
    @IBOutlet weak var brandTableView: UITableView!
    
    let searchBar = UISearchBar()
    let brandSearchDataManager = BrandSearchDataManager()
    var brandSearchList: [BrandListResult] = []
    var searchText: String?
     
    
//MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureSearchBar()
        self.configureNavigationBar()
        self.setTableView()
    }
    
    
//MARK: - private function
    private func configureSearchBar() {
        searchBar.delegate = self
        
        //navigation bar - add search bar
        searchBar.placeholder = "브랜드 검색"
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        searchBar.searchTextField.backgroundColor = UIColor(red: 250/255, green: 249/255, blue: 250/255, alpha: 1.0)
        searchBar.searchTextField.font = .systemFont(ofSize: 15, weight: .semibold)
        searchBar.searchTextField.tintColor = .darkGray
        self.navigationItem.titleView = searchBar
        
        //서치 탭에 들어왔을 때 자동으로 focus 되도록
        searchBar.becomeFirstResponder()
    }
    
    private func configureNavigationBar() {
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(tapBackButton))
        leftButton.tintColor = .black
        self.navigationItem.leftBarButtonItems = [leftButton]
    }
    
    private func setTableView() {
        self.brandTableView.delegate = self
        self.brandTableView.dataSource = self
        self.brandTableView.register(UINib(nibName: "SimpleBrandTableViewCell", bundle: nil), forCellReuseIdentifier: "SimpleBrandTableViewCell")
    }
    
//MARK: - objc function
    @objc func tapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}


//MARK: - Extension
extension BrandSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchBar.text
        
        guard let searchText = self.searchText else {return}
        self.showIndicator()
        brandSearchDataManager.getData(name: searchText, page: 1) { response in
            self.brandSearchList = response
            
            DispatchQueue.main.async {
                self.brandTableView.reloadData()
                self.dismissIndicator()
            }
        }
    }
}

extension BrandSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.brandSearchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.brandTableView.dequeueReusableCell(withIdentifier: "SimpleBrandTableViewCell", for: indexPath) as? SimpleBrandTableViewCell else {return UITableViewCell()}
        
        let url = URL(string: self.brandSearchList[indexPath.row].logo)
        cell.brandImageView.kf.setImage(with: url)
        cell.brandNameLabel.text = self.brandSearchList[indexPath.row].brandName
        cell.brandEnglishNameLabel.text = self.brandSearchList[indexPath.row].englishName
        cell.brandItemCountLabel.text = self.brandSearchList[indexPath.row].itemCnt
        
        //follow button
        if self.brandSearchList[indexPath.row].follow {
            cell.brandFollowButton.followed()
        } else {
            cell.brandFollowButton.notFollow()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
}
