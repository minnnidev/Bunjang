//
//  ServiceAgreeViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/31.
//

import UIKit
import PanModal

struct Terms {
    var check: Bool
    var term: String
}

protocol TermsAgreeDelegate: AnyObject {
    func sendTermsAgree(_ Agree: Bool)
}

class ServiceAgreeViewController: UIViewController {
    @IBOutlet weak var checkView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var checkButton: UIButton!
    weak var delegate: TermsAgreeDelegate?
    
    var terms = [
        Terms(check: false, term: "번개장터 이용약관 (필수)"),
        Terms(check: false, term: "개인정보 수집 이용 동의 (필수)"),
        Terms(check: false, term: "휴대폰 본인확인서비스 (필수)"),
        Terms(check: false, term: "휴먼 개인정보 분리보관 동의 (필수)"),
        Terms(check: false, term: "위치정보 이용약관 동의 (필수)"),
        Terms(check: false, term: "개인정보 수집 이용 동의 (선택)"),
        Terms(check: false, term: "마케팅 수신 동의 (선택)"),
        Terms(check: false, term: "개인정보 광고활용 동의 (선택)")
    ]
    var isCheck = false
    
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.setTableView()
    }
    
//MARK: - private function
    private func configureView() {
        self.checkView.layer.cornerRadius = 5
        self.checkView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.checkView.layer.borderWidth = 1
        
        self.nextButton.layer.cornerRadius = 5
    }
    
    private func setTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "TermsTableViewCell", bundle: nil), forCellReuseIdentifier: "TermsTableViewCell")
    }
    
//MARK: - Action
    @IBAction func tapCheckButton(_ sender: UIButton) {
        if isCheck {
            isCheck = false
            self.checkButton.tintColor = .lightGray
            
            for i in 0 ..< self.terms.count {
                self.terms[i].check = false
            }
            
            self.nextButton.backgroundColor = UIColor(red: 215/255, green: 169/255, blue: 171/255, alpha: 1.0)
            
        } else {
            isCheck = true
            self.checkButton.tintColor = .mainRedColor
            
            for i in 0 ..< self.terms.count {
                self.terms[i].check = true
            }
            
            self.nextButton.backgroundColor = .mainRedColor
        }
        self.tableView.reloadData()
    }
    
    @IBAction func tapNextButton(_ sender: UIButton) {
        if isCheck {
            self.delegate?.sendTermsAgree(true)
            self.dismiss(animated: true, completion: nil)
        } else {
            self.presentAlert(title: "약관 동의가 필요합니다")
        }
    }
    
}

//MARK: - Extension: panmodal
extension ServiceAgreeViewController: PanModalPresentable {
       var panScrollable: UIScrollView? {
           return nil
       }

       var shortFormHeight: PanModalHeight {
           return .contentHeight(400)
       }

       var longFormHeight: PanModalHeight {
           return .maxHeightWithTopInset(0)
       }
}

//MARK: - Extension: TableView
extension ServiceAgreeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "TermsTableViewCell", for: indexPath) as? TermsTableViewCell else {return UITableViewCell()}
        
        cell.termLabel.text = terms[indexPath.row].term
        
        if terms[indexPath.row].check {
            cell.checkButton.tintColor = .mainRedColor
        } else {
            cell.checkButton.tintColor = .lightGray
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(30)
    }
}
