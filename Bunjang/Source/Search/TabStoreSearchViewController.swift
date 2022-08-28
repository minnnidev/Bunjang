//
//  TabStoreSearchViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/28.
//

import UIKit

class TabStoreSearchViewController: UIViewController {
    @IBOutlet weak var storeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.storeTableView.delegate = self
        self.storeTableView.dataSource = self
        
        self.storeTableView.register(UINib(nibName: "SearchStoreTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchStoreTableViewCell")
    }
}

extension TabStoreSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.storeTableView.dequeueReusableCell(withIdentifier: "SearchStoreTableViewCell", for: indexPath) as? SearchStoreTableViewCell else {return UITableViewCell()}
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
