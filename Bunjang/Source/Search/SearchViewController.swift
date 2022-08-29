//
//  SearchViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/21.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var searchContainerView: UIView!
    
    
    let searchBar = UISearchBar()
    var recentSearchList: [String] = []
    
    
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureSearchBar()
        self.configureView()
        self.setCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async {
            self.searchCollectionView.reloadData()
        }
    }
    
//MARK: - objc function
    @objc func tapMethod() {
        self.searchBar.resignFirstResponder()
    }
    
//MARK: - private function
    
    private func configureView() {
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapMethod))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        
        //myScrollView.addGestureRecognizer(singleTapGestureRecognizer)
        
        self.bannerImageView.layer.cornerRadius = 5
    }
    
    private func configureSearchBar() {
        self.searchBar.delegate = self
        
        //navigation bar - add search bar
        searchBar.placeholder = "검색어를 입력해 주세요"
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        searchBar.searchTextField.backgroundColor = UIColor(red: 250/255, green: 249/255, blue: 250/255, alpha: 1.0)
        searchBar.searchTextField.font = .systemFont(ofSize: 15, weight: .semibold)
        searchBar.searchTextField.tintColor =  UIColor(red: 203/255, green: 204/255, blue: 203/255, alpha: 1.0)
        self.navigationItem.titleView = searchBar
        
        //서치 탭에 들어왔을 때 자동으로 focus 되도록
        searchBar.becomeFirstResponder()
    }
    
    private func setCollectionView() {
        self.searchCollectionView.delegate = self
        self.searchCollectionView.dataSource = self
        
        self.searchCollectionView.register(UINib(nibName: "RecentSearchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RecentSearchCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        self.searchCollectionView.collectionViewLayout = flowLayout
    }
}

//MARK: - Extension: UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        
        guard let searchText = self.searchBar.text else {return}
        self.recentSearchList.append(searchText)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultViewController") as! SearchResultViewController
        vc.searchWord = self.searchBar.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        /*
        if searchText == "" {
            self.searchContainerView.isHidden = true
        } else {
            self.searchContainerView.isHidden = false
            
        }
         */
    }
}

//MARK: - Extension: UICollectionView
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.recentSearchList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.searchCollectionView.dequeueReusableCell(withReuseIdentifier: "RecentSearchCollectionViewCell", for: indexPath) as? RecentSearchCollectionViewCell else {return UICollectionViewCell()}
        
        cell.searchLabel.text = self.recentSearchList[indexPath.row]
        
        return cell
    }
}

//MARK: - Extension: UICollectionViewDelegateFlowLayout
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let label = UILabel(frame: CGRect.zero)
        label.text = self.recentSearchList[indexPath.item]
        label.sizeToFit()
    
        
        let cellWidth = label.frame.width + 40
        
        return CGSize(width: cellWidth, height: 40)
    }
}

