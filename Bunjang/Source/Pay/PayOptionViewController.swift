//
//  PayOptionViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/31.
//

import UIKit

enum PayOption: String {
    case credit = "신용/체크카드"
    case kakaoPay = "카카오페이"
    case naverPay = "네이버페이"
    case no = "없음"
}

protocol PayOptionDelegate: AnyObject {
    func sendPayOption(_ payOption: PayOption)
}

class PayOptionViewController: UIViewController {
    @IBOutlet weak var creditView: UIView!
    @IBOutlet weak var kakaoPayView: UIView!
    @IBOutlet weak var naverPayView: UIView!
    @IBOutlet weak var tossView: UIView!
    @IBOutlet weak var simplePayView: UIView!
    @IBOutlet weak var phonePayView: UIView!
    @IBOutlet weak var storePayView: UIView!
    @IBOutlet weak var noBankBookView: UIView!
    @IBOutlet weak var chaiPayView: UIView!
    @IBOutlet weak var creditCheckButton: UIButton!
    @IBOutlet weak var kakaoCheckButton: UIButton!
    @IBOutlet weak var naverCheckButton: UIButton!
    
    
    var isCredit = false
    var isKakao = false
    var isNaver = false
    var payOption: PayOption = .credit
    weak var delegate: PayOptionDelegate?

//MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        
        let creditGesture = UITapGestureRecognizer(target: self, action: #selector(tapCredit))
        self.creditView.addGestureRecognizer(creditGesture)
        
        let kakaoGesture = UITapGestureRecognizer(target: self, action: #selector(tapKakao))
        self.kakaoPayView.addGestureRecognizer(kakaoGesture)
        
        let naverGesture = UITapGestureRecognizer(target: self, action: #selector(tapNaver))
        self.naverPayView.addGestureRecognizer(naverGesture)
    }
    
    @objc func tapCredit() {
        if isCredit {
            self.creditView.layer.borderColor = UIColor.borderGrayColor.cgColor
            self.creditCheckButton.tintColor = .borderGrayColor
            self.isCredit = false
        } else {
            self.creditView.layer.borderColor = UIColor.mainRedColor.cgColor
            self.creditCheckButton.tintColor = .mainRedColor
            self.isCredit = true
            self.payOption = .credit
        }
    }
    
    @objc func tapKakao() {
        if isKakao {
            self.kakaoPayView.layer.borderColor = UIColor.borderGrayColor.cgColor
            self.kakaoCheckButton.tintColor = .borderGrayColor
            self.isKakao = false
        } else {
            self.kakaoPayView.layer.borderColor = UIColor.mainRedColor.cgColor
            self.kakaoCheckButton.tintColor = .mainRedColor
            self.isKakao = true
            self.payOption = .kakaoPay
        }
    }
    
    @objc func tapNaver() {
        if isNaver {
            self.naverPayView.layer.borderColor = UIColor.borderGrayColor.cgColor
            self.naverCheckButton.tintColor = .borderGrayColor
            self.isNaver = false
        } else {
            self.naverPayView.layer.borderColor = UIColor.mainRedColor.cgColor
            self.naverCheckButton.tintColor = .mainRedColor
            self.isNaver = true
            self.payOption = .naverPay
        }
    }
    
//MARK: - Private function
    private func configureView() {
        self.creditView.layer.borderWidth = 1
        self.creditView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.creditView.layer.cornerRadius = 5
        
        self.kakaoPayView.layer.borderWidth = 1
        self.kakaoPayView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.kakaoPayView.layer.cornerRadius = 5
        
        self.naverPayView.layer.borderWidth = 1
        self.naverPayView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.naverPayView.layer.cornerRadius = 5
        
        self.tossView.layer.borderWidth = 1
        self.tossView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.tossView.layer.cornerRadius = 5
        
        self.simplePayView.layer.borderWidth = 1
        self.simplePayView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.simplePayView.layer.cornerRadius = 5
        
        self.phonePayView.layer.borderWidth = 1
        self.phonePayView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.phonePayView.layer.cornerRadius = 5
        
        self.storePayView.layer.borderWidth = 1
        self.storePayView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.storePayView.layer.cornerRadius = 5
        
        self.noBankBookView.layer.borderWidth = 1
        self.noBankBookView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.noBankBookView.layer.cornerRadius = 5
        
        self.chaiPayView.layer.borderWidth = 1
        self.chaiPayView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.chaiPayView.layer.cornerRadius = 5
    }
    
    
//MARK: - Action
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func tapRegisterButton(_ sender: UIButton) {
        self.delegate?.sendPayOption(self.payOption)
        self.navigationController?.popViewController(animated: true)
    }
    

}
