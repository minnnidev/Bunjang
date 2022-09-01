//
//  ReservedViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/23.
//

import UIKit

class ReservedViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var searchItemTextField: UITextField!
    @IBOutlet weak var searchTextField: UITextField!
    
    let dataManager = ViewSaleListDataManager()
    let searchMyItemDataManager = SearchMyItemDataManager()
    var result: [ViewSaleResponse] = []
    
    
//MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTableView()
        self.fetchData()
    }
    
//MARK: - Private function
        private func fetchData() {
            //로그인 시 userIdx 받아옴 - 지금은 예시!
            dataManager.getData(condition: "R") { response in
                self.result = response
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                    self.countLabel.text = String(self.result.count)
                }
            }
        }
        
        private func setTableView() {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            
            self.tableView.register(UINib(nibName: "SellingProductTableViewCell", bundle: nil), forCellReuseIdentifier: "SellingProductTableViewCell")
        }
    
//MARK: - Action

    @IBAction func tapSearchButton(_ sender: UIButton) {
        guard let text = self.searchTextField.text else {return}
        
        searchMyItemDataManager.getSearchMyItem(condition: "R", itemName: text) { [weak self ] response in
            
            self?.result = response
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
    }
}

//MARK: - Extension
extension ReservedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.result.count == 0 {
            self.tableView.alpha = 0
        } else {
            self.tableView.alpha = 1
        }
        return self.result.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "SellingProductTableViewCell", for: indexPath) as? SellingProductTableViewCell else {return UITableViewCell()}
        
        //데이터 받아오기
        cell.itemNameLabel.text = self.result[indexPath.row].itemName
        cell.itemPriceLabel.text = self.result[indexPath.row].price
        cell.itemDateLabel.text = self.result[indexPath.row].time
        
        //이미지
        cell.itemImageView.kf.indicatorType = .activity
        let data = URL(string: self.result[indexPath.row].image)
        cell.itemImageView.kf.setImage(with: data)
        
        //예약중 이미지 보여주기
        cell.statusView.isHidden = false
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(130)
    }
}
