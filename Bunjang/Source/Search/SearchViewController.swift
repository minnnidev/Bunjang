//
//  SearchViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/21.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var myScrollView: UIScrollView!
    
    let searchBar = UISearchBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bannerImage.layer.cornerRadius = 8
        self.configureSearchBar()
        self.searchBar.delegate = self
        
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapMethod))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        myScrollView.addGestureRecognizer(singleTapGestureRecognizer)
    }
    
    @objc func tapMethod() {
        self.searchBar.resignFirstResponder()
    }
    
    private func configureSearchBar() {
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
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultViewController") as! SearchResultViewController
        vc.searchWord = self.searchBar.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
