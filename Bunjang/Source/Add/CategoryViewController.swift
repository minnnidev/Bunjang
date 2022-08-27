//
//  CategoryViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/22.
//

import UIKit


class CategoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let addCategory = AddCategory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTableView()
    }
    
    private func setTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        self.tableView.register(UINib(nibName: "ExtraTableViewCell", bundle: nil), forCellReuseIdentifier: "ExtraTableViewCell")
    }
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.addCategory.firstCategory.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "전체"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(60)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        if indexPath.row == 19 {
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "ExtraTableViewCell", for: indexPath) as? ExtraTableViewCell else {return UITableViewCell()}
            return cell
        } else {
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell else {return UITableViewCell()}
            cell.categoryNameLabel.text = self.categoryName[indexPath.row]
            return cell
        }
         */
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell else {return UITableViewCell()}
        cell.categoryNameLabel.text = self.addCategory.firstCategory[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondCategoryViewController") as! SecondCategoryViewController
        vc.indexPath = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
