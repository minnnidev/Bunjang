//
//  SecondCategoryViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/27.
//

import UIKit

class SecondCategoryViewController: UIViewController {
    @IBOutlet weak var secondCategoryTableView: UITableView!
    let addCategory = AddCategory()
    
    var indexPath: Int?
    var categoryCode: CategoryCode?
    
    
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
    }
    
//MARK: - private function
    private func setTableView() {
        self.secondCategoryTableView.delegate = self
        self.secondCategoryTableView.dataSource = self
        
        self.secondCategoryTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
    }
}

//MARK: - Extension
extension SecondCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let indexPath = self.indexPath {
            return self.addCategory.secondCategory[indexPath].count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.secondCategoryTableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell else {return UITableViewCell()}
        if let safeData = self.indexPath {
            cell.categoryNameLabel.text = self.addCategory.secondCategory[safeData][indexPath.row]
            cell.chevronImage.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //이름과 코드 받아오기
        if let safeData = self.indexPath {
            self.categoryCode = CategoryCode(categoryName: self.addCategory.categoryFullName[safeData][indexPath.row], categoryCode: self.addCategory.categoryCode[safeData][indexPath.row])
        }
        
        //넘겨 주기 - notification center 이용
        if let categoryCode = self.categoryCode {
            NotificationCenter.default.post(name: NSNotification.Name("test"), object: categoryCode)
        }
        
        //등록 화면으로 돌아가기
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
