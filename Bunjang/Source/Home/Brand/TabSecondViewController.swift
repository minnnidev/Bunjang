//
//  TabSecondViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/20.
//

import UIKit

class TabSecondViewController: UIViewController {
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var viewBrandButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        self.setTableView()
    }
   
//MARK: - Private function
    private func configureView() {
        self.addButton.layer.cornerRadius = 18
        self.editButton.layer.cornerRadius = 18
        self.viewBrandButton.layer.cornerRadius = 7
    }
    
    private func setTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "BrandTableViewCell", bundle: nil), forCellReuseIdentifier: "BrandTableViewCell")
    }
    
    
//MARK: - Action
    @IBAction func tapViewBrandButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BrandListViewController") as! BrandListViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


//MARK: - Extension function
extension TabSecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "BrandTableViewCell", for: indexPath) as? BrandTableViewCell else {return UITableViewCell()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(320)
    }
}
