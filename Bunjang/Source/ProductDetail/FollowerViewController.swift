//
//  FollowerViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/31.
//

import UIKit
import Kingfisher

class FollowerViewController: UIViewController {
    @IBOutlet weak var followerTableView: UITableView!
    
    var userIdx: String?
    let viewFollowersDataManager = ViewFollowersDataManager()
    var followersList: [ViewFollowersResponse] = []
    
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
        self.followerTableView.delegate = self
        self.followerTableView.dataSource = self
        
        self.followerTableView.register(UINib(nibName: "SearchStoreTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchStoreTableViewCell")
    }
    
    private func fetchData() {
        guard let userIdx = self.userIdx else {return}
        self.showIndicator()
        viewFollowersDataManager.getData(userIdx: userIdx) { response in
            self.followersList = response
            
            DispatchQueue.main.async {
                self.followerTableView.reloadData()
                self.dismissIndicator()
            }
        }
    }
    
//MARK: - Action
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - Extension
extension FollowerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.followersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.followerTableView.dequeueReusableCell(withIdentifier: "SearchStoreTableViewCell", for: indexPath) as? SearchStoreTableViewCell else {return UITableViewCell()}
        
        let url = URL(string: self.followersList[indexPath.row].storeImage)
        
        cell.storeImageView.kf.setImage(with: url)
        cell.storeNameLabel.text = self.followersList[indexPath.row].storeName
        cell.itemCountLabel.text = self.followersList[indexPath.row].items
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
}
