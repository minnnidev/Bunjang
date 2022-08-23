//
//  CategoryViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/22.
//

import UIKit

protocol SendCategoryDelegate: AnyObject {
    func sendCategory(_ category: String)
}

class CategoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: SendCategoryDelegate?
    var categoryName = [
        "여성의류", "남성의류", "신발", "가방", "시계/쥬얼리", "패션 엑세서리",
        "디지털/가전", "스포츠/레저", "차량/오토바이", "스타굿즈", "키덜트",
        "예술/희귀/수집품", "음반/악기", "도서/티켓/문구", "뷰티/미용", "가급/인테리어",
        "생활/가공식품", "유아동/출산", "반려동물용품", "기타", "지역 서비스", "원룸/함께살아요",
        "번개나눔", "구인구직", "재능", "커뮤니티"
    ]
    
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
        return 26
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "전체"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(60)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 19 {
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "ExtraTableViewCell", for: indexPath) as? ExtraTableViewCell else {return UITableViewCell()}
            return cell
        } else {
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell else {return UITableViewCell()}
            cell.categoryNameLabel.text = self.categoryName[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.sendCategory(self.categoryName[indexPath.row] )
        self.navigationController?.popViewController(animated: true)
    }
}
