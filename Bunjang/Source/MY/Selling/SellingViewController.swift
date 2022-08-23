//
//  SellingViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/23.
//

import UIKit

class SellingViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let tapMyDataManager = TapMyDataManager()
    var itemResponseList: [ItemsResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setTableView()
        
        /*
        //로그인 시 userIdx 받아옴
        tapMyDataManager.sendData(userIdx: 1) { response in
            self.itemResponseList = response.itemsResponses
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
         */
        
    }
    
    private func setTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "SellingProductTableViewCell", bundle: nil), forCellReuseIdentifier: "SellingProductTableViewCell")
    }
    


}

extension SellingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.itemResponseList.count
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "SellingProductTableViewCell", for: indexPath) as? SellingProductTableViewCell else {return UITableViewCell()}
        
        /*
        //cell에 데이터 넣기
        cell.itemNameLabel.text = self.itemResponseList[indexPath.row].itemName
        cell.itemPriceLabel.text = self.itemResponseList[indexPath.row].price
        
        cell.itemImageView.kf.indicatorType = .activity
        let url = URL(string: self.itemResponseList[indexPath.row].image)
        cell.itemImageView.kf.setImage(with: url)
        */
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(130)
    }
}
