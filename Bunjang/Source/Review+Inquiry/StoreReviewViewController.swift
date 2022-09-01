//
//  StoreReviewViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/29.
//

import UIKit

class StoreReviewViewController: UIViewController {
    @IBOutlet weak var reviewTableView: UITableView!
    
    var seller: String?
    let reviewDataManager = ReviewDataManager()
    var reviewList: [ReviewResponse] = []
    
//MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
        
        guard let seller = self.seller else {return}
        
        reviewDataManager.getReview(seller: seller) { response in
            //self.reviewList = response
            
            print(response)
        }
    }
    
//MARK: - private function
    private func setTableView() {
        self.reviewTableView.delegate = self
        self.reviewTableView.dataSource = self
        
        self.reviewTableView.register(UINib(nibName: "ReviewHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewHeaderTableViewCell")
    }
    
}

//MARK: - Extension
extension StoreReviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                guard let cell = self.reviewTableView.dequeueReusableCell(withIdentifier: "ReviewHeaderTableViewCell", for: indexPath) as? ReviewHeaderTableViewCell else {return UITableViewCell()}
                return cell
            default:
                return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
            case 0:
                return CGFloat(60)
            default:
                return CGFloat(10)
        }

    }
}
