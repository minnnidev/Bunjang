//
//  FollowingViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/31.
//

import UIKit

class FollowingViewController: UIViewController {
    @IBOutlet weak var followingTableView: UITableView!
    
//MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
    }
    
//MARK: - private function
    private func setTableView() {
        self.followingTableView.delegate = self
        self.followingTableView.dataSource = self
        
        self.followingTableView.register(UINib(nibName: "FollowingTableViewCell", bundle: nil), forCellReuseIdentifier: "FollowingTableViewCell")
    
    }
    
//MARK: - Action
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension FollowingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.followingTableView.dequeueReusableCell(withIdentifier: "FollowingTableViewCell", for: indexPath) as? FollowingTableViewCell else {return UITableViewCell()}
        return cell
    }
}
