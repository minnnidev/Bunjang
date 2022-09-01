//
//  ViewStoreController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/28.
//

import UIKit
import Kingfisher

class ViewStoreController: UIViewController {
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var openDateLabel: UILabel!
    @IBOutlet weak var hitLabel: UILabel!
    @IBOutlet weak var soldCountLabel: UILabel!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var countLabel2: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var policyTextView: UITextView!
    @IBOutlet weak var precautionTextView: UITextView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var certificatedView: UIView!
    @IBOutlet weak var inquiryTextField: UITextField!
    @IBOutlet weak var contactStartLabel: UILabel!
    @IBOutlet weak var contactEndLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    //info
    @IBOutlet weak var followerView: UIView!
    @IBOutlet weak var followingView: UIView!
    
    
    //scrollView
    @IBOutlet weak var itemCollectionView: UICollectionView!
    @IBOutlet weak var reviewTableView: UITableView!
    @IBOutlet weak var inquiryTableView: UITableView!
    
    //받아올 sellerIdx
    var seller: String?
    var userIdx: String? //info 화면으로 보내줄 idx
    
    let viewStoreDataManager = ViewStoreDataManager()
    let myProfileDataManager = TapMyDataManager()
    var itemResult: [ItemsResponse] = []
    var reviewResult: [ReviewsResponse] = []
    var inquiryResult: [InquiryResponse] = []
    let inquiryAddDataManager = InquiryAddDataManager()
    var isPreview = false
    
//MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.fetchData()
        self.setCollectionView()
        self.setTableView()
        self.setGesture()
        
        if isPreview {
            self.titleLabel.text = "상점 미리보기"
        }
    }
    
    
//MARK: - private function
    private func configureView() {
        self.storeImage.layer.cornerRadius = self.storeImage.frame.width/2
        self.storeImage.clipsToBounds = true
        self.registerButton.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.registerButton.layer.borderWidth = 1
    }
    
    private func fetchData() {
        guard let seller = self.seller else {return}
        
        self.showIndicator()
        viewStoreDataManager.getData(userIdx: seller) { [weak self] response in
            self?.userIdx = response.storeId
            
            self?.itemResult = response.itemsResponses
            self?.reviewResult = response.reviewsResponses
            self?.inquiryResult = response.inquiryResponses
            
            let url = URL(string: response.storeImage)
            self?.storeImage.kf.setImage(with: url)
            
            self?.storeName.text = response.storeName
            self?.soldCountLabel.text = response.soldCount
            self?.followingLabel.text = response.followings
            self?.followerLabel.text = response.followers
            
            if !(response.isCertificated) { //본인 인증이 되지 않았으면
                self?.certificatedView.isHidden = true
            }
            
            self?.countLabel2.text = response.soldCount + "회"
            self?.descriptionTextView.text = response.description
            self?.policyTextView.text = response.policy
            self?.precautionTextView.text = response.precaution
            
            self?.openDateLabel.text = response.openDate
            self?.hitLabel.text = response.hit
            
            self?.contactStartLabel.text = response.contactStart
            self?.contactEndLabel.text = response.contactEnd
            
            DispatchQueue.main.async {
                self?.itemCollectionView.reloadData()
                self?.reviewTableView.reloadData()
                self?.inquiryTableView.reloadData()
                self?.dismissIndicator() 
            }
        }
    }
    
    private func setCollectionView() {
        self.itemCollectionView.delegate = self
        self.itemCollectionView.dataSource = self
        
        self.itemCollectionView.register(UINib(nibName: "StoreItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoreItemCollectionViewCell")
    
        self.itemCollectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.scrollDirection = .horizontal
        let width = UIScreen.main.bounds.width - 15
        flowLayout.itemSize = CGSize(width: width/3, height: 180)
        self.itemCollectionView.collectionViewLayout = flowLayout
    }
    
    private func setTableView() {
        self.reviewTableView.delegate = self
        self.reviewTableView.dataSource = self
        self.reviewTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        self.reviewTableView.register(UINib(nibName: "StoreReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "StoreReviewTableViewCell")
        
        self.inquiryTableView.delegate = self
        self.inquiryTableView.dataSource = self
        self.inquiryTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.inquiryTableView.register(UINib(nibName: "StoreInquiryTableViewCell", bundle: nil), forCellReuseIdentifier: "StoreInquiryTableViewCell")
    }
    
    private func setGesture() {
        let followerGesture = UITapGestureRecognizer(target: self, action: #selector(tapFollower))
        self.followerView.addGestureRecognizer(followerGesture)
        
        let followingGesture = UITapGestureRecognizer(target: self, action: #selector(tapFollowing))
        self.followingView.addGestureRecognizer(followingGesture)
    
    }
    
//MARK: - objc function
    @objc func tapFollower() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FollowerViewController") as! FollowerViewController
        vc.userIdx = self.userIdx 
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tapFollowing() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FollowingViewController") as! FollowingViewController
        vc.userIdx = self.userIdx
        self.navigationController?.pushViewController(vc, animated: true)
    }
//MARK: - Action
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
     
    @IBAction func tapInquiryRegisterButton(_ sender: UIButton) {
        guard let text = self.inquiryTextField.text else {return}
        guard let seller = self.seller else {return}
        
        inquiryAddDataManager.postInquiry(userIdx: "1", storeIdx: seller, parameters: InquiryAddRequest(post: text)) { response in
            DispatchQueue.main.async {
                self.inquiryTableView.reloadData()
            }
        }
    }
    
    
}

//MARK: - Extension

extension ViewStoreController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.itemResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        guard let cell = self.itemCollectionView.dequeueReusableCell(withReuseIdentifier: "StoreItemCollectionViewCell", for: indexPath) as? StoreItemCollectionViewCell else {return StoreItemCollectionViewCell()}
        
        let url = URL(string: self.itemResult[indexPath.row].image)
        cell.itemImageView.kf.setImage(with: url)
        cell.itemPriceLabel.text = self.itemResult[indexPath.row].price
        cell.itemNameLabel.text = self.itemResult[indexPath.row].itemName
        
        return cell
    }
}

extension ViewStoreController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == reviewTableView {
            if self.reviewResult.count == 0 {
                self.reviewTableView.isHidden = true
            } else {
                self.reviewTableView.isHidden = false
            }
            return self.reviewResult.count
        }
        
        if tableView == inquiryTableView {
            if self.inquiryResult.count == 0 {
                self.inquiryTableView.isHidden = true
            } else {
                self.inquiryTableView.isHidden = false
            }
            return self.inquiryResult.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == reviewTableView {
            guard let cell = self.reviewTableView.dequeueReusableCell(withIdentifier: "StoreReviewTableViewCell", for: indexPath) as? StoreReviewTableViewCell else {return UITableViewCell()}
            
            
            let url = URL(string: self.reviewResult[indexPath.row].reviewerImage)
            cell.reviewImageView.kf.setImage(with: url)
            cell.reviewerNameLabel.text = self.reviewResult[indexPath.row].reviewerName
            cell.reviewContentView.text = self.reviewResult[indexPath.row].post
            cell.reviewDateLabel.text = self.reviewResult[indexPath.row].date
            
            return cell
        }
        
        if tableView == inquiryTableView {
            guard let cell = self.inquiryTableView.dequeueReusableCell(withIdentifier: "StoreInquiryTableViewCell", for: indexPath) as? StoreInquiryTableViewCell else {return UITableViewCell()}
            
            let url = URL(string: self.inquiryResult[indexPath.row].image)
            cell.inquiryImageView.kf.setImage(with: url)
            cell.inquiryDateLabel.text = self.inquiryResult[indexPath.row].date
            cell.inquiryNameLabel.text = self.inquiryResult[indexPath.row].name
            cell.inquiryContentView.text = self.inquiryResult[indexPath.row].post
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == reviewTableView {
            return 120
        }
        
        if tableView == inquiryTableView {
            return 100
        }
        
        return 0
    }
}
