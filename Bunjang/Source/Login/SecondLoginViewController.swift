//
//  SecondLoginViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/24.
//

import UIKit
import PanModal

class SecondLoginViewController: UIViewController {
    @IBOutlet weak var firstTextFieldView: UIView!
    @IBOutlet weak var secondTextFieldView: UIView!
    
    @IBOutlet weak var carrierLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    var isTermsAgree = false


//MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isTermsAgree {
            isTermsAgree = false
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MessageCertificationViewController") as! MessageCertificationViewController
            
            guard let name = self.nameTextField.text else {return}
            guard let birthNumber = self.birthTextField.text else {return}
            guard let phoneNumber = self.phoneTextField.text else {return}
            
            let signIn = SignInRequest(name: name, birthNumber: birthNumber, phoneNumber: phoneNumber, isChecked: false)
            vc.signIn = signIn
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.setGesture()
        self.configureNavigationBar()
        
        self.completeButton.isEnabled = false
    }
    
//MARK: - private function
    private func configureNavigationBar() {
        self.navigationItem.hidesBackButton = true
        
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: nil)
        button.tintColor = .black
        self.navigationItem.leftBarButtonItems = [button]
    }
    
    private func configureView() {
        
        self.phoneTextField.delegate = self
        self.birthTextField.delegate = self
        self.nameTextField.delegate = self
        
        self.phoneTextField.becomeFirstResponder()
        self.completeButton.layer.cornerRadius = 5
    }
    
    private func setGesture() {
        let carrierGesture = UITapGestureRecognizer(target: self, action: #selector(tapCarrier))
        self.secondTextFieldView.addGestureRecognizer(carrierGesture)
    }
   
    
//MARK: - selector function

    @objc func tapCompleteButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func tapCarrier() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CarrierViewController") as! CarrierViewController
        vc.delegate = self
        self.presentPanModal(vc)
    }
    
    
//MARK: - Action
    @IBAction func signInButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ServiceAgreeViewController") as! ServiceAgreeViewController
        vc.delegate = self
        self.presentPanModal(vc)
    }
    
}


//MARK: - Extension
extension SecondLoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameTextField {
            self.completeButton.backgroundColor = .mainRedColor
            self.completeButton.isEnabled = true
        }
    }
}

extension SecondLoginViewController: CarrierViewDelegate {
    func sendCarrier(_ carrier: Carrier) {
        self.carrierLabel.text = carrier.rawValue
        self.carrierLabel.textColor = .black
        self.carrierLabel.font = .systemFont(ofSize: 16, weight: .bold)
    }
}

extension SecondLoginViewController: TermsAgreeDelegate {
    func sendTermsAgree(_ Agree: Bool) {
        self.isTermsAgree = Agree
        print(self.isTermsAgree)
    }
}
