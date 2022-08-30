//
//  PayViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/30.
//

import UIKit
import DLRadioButton

class PayPostViewController: UIViewController {
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var messageInputView: UIView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var pointView: UIView!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var simplePayBanner: UIImageView!
    @IBOutlet weak var simplePayButton: DLRadioButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var seeAllButton: UIButton!
    @IBOutlet weak var seeDetailButton: UIButton!
    @IBOutlet weak var BGZTbutton: UIButton!
    
    var isAgree = false
    
    
//MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
//MARK: - private function
    private func configureView() {
        self.addressView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.addressView.layer.borderWidth = 1
        self.addressView.layer.cornerRadius = 5
        
        self.messageInputView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.messageInputView.layer.borderWidth = 1
        self.messageInputView.layer.cornerRadius = 5
        
        self.messageView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.messageView.layer.borderWidth = 1
        self.messageView.layer.cornerRadius = 5
        
        self.pointView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.pointView.layer.borderWidth = 1
        self.pointView.layer.cornerRadius = 5
        
        self.priceView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.priceView.layer.borderWidth = 1
        self.priceView.layer.cornerRadius = 5
        
        self.registerView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.registerView.layer.borderWidth = 1
        self.registerView.layer.cornerRadius = 5
        
        self.simplePayBanner.layer.cornerRadius = 5
        
        self.simplePayButton.isSelected = true
        self.registerButton.setUnderline()
        
        self.seeAllButton.setUnderline()
        self.seeDetailButton.setUnderline()
    }
    
//MARK: - Action
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func tapAgreeButton(_ sender: UIButton) {
        if isAgree {
            isAgree = false
            self.BGZTbutton.tintColor = .mainRedColor
        } else {
            isAgree = true
            self.BGZTbutton.tintColor = .lightGray
        }
    }
    
    @IBAction func tapPayButton(_ sender: UIButton) {
    }
}
