//
//  FollowingViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/31.
//

import UIKit
import Kingfisher

class FollowingViewController: UIViewController {
    @IBOutlet weak var followingTableView: UITableView!
    
    let viewFollowingsDataManager = ViewFollowingsDataManager()
    let viewStoreDataManager = ViewStoreDataManager()
    var followingsList: [ViewFollowingsResponse] = []
    var userIdx: String?
    
//MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
        self.fetchData()
    }
    
//MARK: - private function
    private func setTableView() {
        self.followingTableView.delegate = self
        self.followingTableView.dataSource = self
        
        self.followingTableView.register(UINib(nibName: "FollowingTableViewCell", bundle: nil), forCellReuseIdentifier: "FollowingTableViewCell")
    }
    
    private func fetchData() {
        self.showIndicator()
        
        guard let userIdx = self.userIdx else {return}
        
        viewFollowingsDataManager.getData(userIdx: userIdx) { response in
            self.followingsList = response
            
            DispatchQueue.main.async {
                self.followingTableView.reloadData()
                self.dismissIndicator()
            }
        }
    }
    
//MARK: - Action
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension FollowingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.followingsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.followingTableView.dequeueReusableCell(withIdentifier: "FollowingTableViewCell", for: indexPath) as? FollowingTableViewCell else {return UITableViewCell()}
        
        //cell custom
        let url = URL(string: self.followingsList[indexPath.row].storeImage)
        cell.storeImageView.kf.setImage(with: url)
        
        cell.itemsCountLabel.text = self.followingsList[indexPath.row].items
        cell.followersCountLabel.text = self.followingsList[indexPath.row].followers
        
        //store name 불러오기
        viewStoreDataManager.getData(userIdx: self.followingsList[indexPath.row].storeIdx) { response in
            cell.storeNameLabel.text = response.storeName
        }
        
        //item
        switch self.followingsList[indexPath.row].itemList.count {
            case 0:
                cell.firstImage.backgroundColor = .white
                cell.secondImage.backgroundColor = .white
                cell.thirdImage.backgroundColor = .white
            case 1:
                let url = URL(string: self.followingsList[indexPath.row].itemList[0].itemImage)
                cell.firstImage.kf.setImage(with: url)
            case 2:
                let url1 = URL(string: self.followingsList[indexPath.row].itemList[0].itemImage)
                cell.firstImage.kf.setImage(with: url1)
                let url2 = URL(string: self.followingsList[indexPath.row].itemList[1].itemImage)
                cell.secondImage.kf.setImage(with: url2)
            default:
                let url1 = URL(string: self.followingsList[indexPath.row].itemList[0].itemImage)
                cell.firstImage.kf.setImage(with: url1)
                let url2 = URL(string: self.followingsList[indexPath.row].itemList[1].itemImage)
                cell.secondImage.kf.setImage(with: url2)
                let url3 = URL(string: self.followingsList[indexPath.row].itemList[2].itemImage)
                cell.thirdImage.kf.setImage(with: url3)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
}
