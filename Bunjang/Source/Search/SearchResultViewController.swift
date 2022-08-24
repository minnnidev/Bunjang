//
//  SearchResultViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/24.
//

import UIKit
import Kingfisher
import PanModal

class SearchResultViewController: UIViewController {
    @IBOutlet weak var brandButton: UIButton!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var townButton: UIButton!
    @IBOutlet weak var priceButton: UIButton!
    @IBOutlet weak var sellCompleteButton: UIButton!
    
    @IBOutlet weak var filterButtonView: UIView!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    @IBOutlet weak var orderLabel: UILabel!
    
    var searchWord: String?
    let searchItemDataManager = SearchDataManager()
    var resultList:[SearchItemResult] = []
    var orderValue: Order = .accuracy
    let searchBar = UISearchBar()
    
    
//MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        
        //back button 숨기기
         self.navigationItem.hidesBackButton = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        self.configureNavigationBar()
        self.setCollectionView()
        self.setGesture()
        self.datafetch()
    }
    
    
//MARK: - private 함수
    private func configureNavigationBar() {
        
        //right bar button
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "house"), style: .plain, target: self, action: nil)
        rightButton.tintColor = .black
        self.navigationItem.rightBarButtonItems = [rightButton]
        
        //navigation bar - add search bar
        searchBar.text = searchWord!
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        searchBar.searchTextField.backgroundColor = UIColor(red: 250/255, green: 249/255, blue: 250/255, alpha: 1.0)
        searchBar.searchTextField.font = .systemFont(ofSize: 15, weight: .semibold)
        searchBar.searchTextField.tintColor =  UIColor(red: 203/255, green: 204/255, blue: 203/255, alpha: 1.0)
        self.navigationItem.titleView = searchBar
        searchBar.delegate = self
    }
    
    private func datafetch() {
        guard let searchWord = self.searchWord else {return}
        searchItemDataManager.getData(name: searchWord, sort: "C", count: 5) { response in
            self.resultList = response
            
            DispatchQueue.main.async {
                self.resultCollectionView.reloadData()
            }
        }
    }
    
    private func setGesture() {
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(tapBackButton))
        leftButton.tintColor = .black
        self.navigationItem.leftBarButtonItems = [leftButton]
        
        let tapFilterGesture = UITapGestureRecognizer(target: self, action: #selector(tapFilterButton))
        filterButtonView.addGestureRecognizer(tapFilterGesture)
    }
    
    private func configureView() {
        self.brandButton.layer.cornerRadius = 5
        self.brandButton.layer.borderWidth = 1
        self.brandButton.layer.borderColor = UIColor(red: 229/255, green: 228/255, blue: 229/255, alpha: 1.0).cgColor
        
        self.categoryButton.layer.cornerRadius = 5
        self.categoryButton.layer.borderWidth = 1
        self.categoryButton.layer.borderColor = UIColor(red: 229/255, green: 228/255, blue: 229/255, alpha: 1.0).cgColor
        
        self.townButton.layer.cornerRadius = 5
        self.townButton.layer.borderWidth = 1
        self.townButton.layer.borderColor = UIColor(red: 229/255, green: 228/255, blue: 229/255, alpha: 1.0).cgColor
        
        self.priceButton.layer.cornerRadius = 5
        self.priceButton.layer.borderWidth = 1
        self.priceButton.layer.borderColor = UIColor(red: 229/255, green: 228/255, blue: 229/255, alpha: 1.0).cgColor
        
        self.sellCompleteButton.layer.cornerRadius = 5
        self.sellCompleteButton.layer.borderWidth = 1
        self.sellCompleteButton.layer.borderColor = UIColor(red: 229/255, green: 228/255, blue: 229/255, alpha: 1.0).cgColor
    }
    
    private func setCollectionView() {
        self.resultCollectionView.delegate = self
        self.resultCollectionView.dataSource = self
        self.resultCollectionView.register(UINib(nibName: "SimpleProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SimpleProductCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 20
        let width = UIScreen.main.bounds.width-40
        flowLayout.itemSize = CGSize(width: (width-14)/3, height: 250)
        self.resultCollectionView.collectionViewLayout = flowLayout
    }
    
    
//MARK: - selector 함수
    @objc func tapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func tapFilterButton() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OptionFilterViewController") as! OptionFilterViewController
        vc.delegate = self
        vc.getOrder = self.orderValue
        self.presentPanModal(vc)
    }
    
}


//MARK: - Extension
extension SearchResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.resultList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.resultCollectionView.dequeueReusableCell(withReuseIdentifier: "SimpleProductCollectionViewCell", for: indexPath) as? SimpleProductCollectionViewCell else {return UICollectionViewCell()}
        
        //custom with data
        cell.priceLabel.text = self.resultList[indexPath.row].price
        cell.nameLabel.text = self.resultList[indexPath.row].name
        
        //product image
        let url = URL(string: self.resultList[indexPath.row].image)
        cell.imgView.kf.indicatorType = .activity
        cell.imgView.kf.setImage(with: url)
        
        //safePay&AD
        if self.resultList[indexPath.row].safePay {
            cell.bungaePayImage.isHidden = false
        }
        if self.resultList[indexPath.row].ad {
            cell.ADImageView.isHidden = false
        }
        
        
        return cell
    }
}

extension SearchResultViewController: OptionFilterViewDelegate {
    func sendData(_ order: Order) {
        guard let searchWord = self.searchWord else {return}
        self.orderValue = order
        searchItemDataManager.getData(name: searchWord, sort: order.rawValue, count: 5) { response in
            self.resultList = response
            self.orderValue = order
            
            DispatchQueue.main.async {
                self.resultCollectionView.reloadData()
                
                switch self.orderValue {
                    case .accuracy:
                        self.orderLabel.text = "정확도순"
                    case .recent:
                        self.orderLabel.text = "최신순"
                    case .lowPrice:
                        self.orderLabel.text = "낮은가격순"
                    case .highPrice:
                        self.orderLabel.text = "높은가격순"
                }
            }
        }
    }
}

extension SearchResultViewController: UISearchBarDelegate {
    //결과 화면에서 한번 더 검색을 할 경우
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        self.searchWord = searchBar.text
        
        guard let searchWord = self.searchWord else {return}
        searchItemDataManager.getData(name: searchWord, sort: self.orderValue.rawValue, count: 5) { response in
            self.resultList = response
            
            DispatchQueue.main.async {
                self.resultCollectionView.reloadData()
            }
        }
    }
}
