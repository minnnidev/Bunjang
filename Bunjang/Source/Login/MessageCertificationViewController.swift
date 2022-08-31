//
//  MessageCertificationViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/31.
//

import UIKit

class MessageCertificationViewController: UIViewController {
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    let smsPostDataManager = SMSPostDataManager()
    let smsCheckDataManager = SMSCheckDataManager()
    let loginDataManager = LoginDataManager()
    
    var signIn: SignInRequest?

//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.configureNavigationBar()
        
        self.smsPost()
    }
    
//MARK: - private function
    private func configureNavigationBar() {
        self.navigationItem.hidesBackButton = true
        
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: nil)
        button.tintColor = .black
        self.navigationItem.leftBarButtonItems = [button]
    }
    
    private func configureView() {
        self.numberTextField.becomeFirstResponder()
        
        guard let phoneNumber = self.signIn?.phoneNumber else {return}
        self.phoneNumberLabel.text = phoneNumber
        
        self.completeButton.layer.cornerRadius = 5
    }
    
    private func smsPost() {
        let phoneNumber = self.signIn?.phoneNumber
        guard let safePhoneNumber = phoneNumber else {return}
        smsPostDataManager.SMSPost(parameters: SMSPostRequest(phoneNumber: safePhoneNumber)) { [weak self] response in
            print(response)
        }
    }
    
    @IBAction func tapCompleteButton(_ sender: UIButton) {
        guard let authNumber = self.numberTextField.text else {return}
        
        self.showIndicator()
        smsCheckDataManager.getData(authNumber: authNumber) { [weak self] response in
            if response.check {
                //인증이 완료되면 로그인되도록 -> jwt 발급
                
                guard let name = self?.signIn?.name else {return}
                guard let birthNumber = self?.signIn?.birthNumber else {return}
                guard let phoneNumber = self?.signIn?.phoneNumber else {return}
                
                let loginRequest = LoginRequest(name: name, birthNumber: birthNumber, phoneNumber: phoneNumber, isChecked: true)
                
                self?.loginDataManager.postLogin(parameters: loginRequest) { [weak self] response in
                    
                    UserDefaults.standard.set(response.jwt, forKey: "jwt")
                    print("발급", UserDefaults.standard.string(forKey: "jwt"))
                    
                    //화면 전환
                    let vc = self?.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                    vc.modalTransitionStyle = .crossDissolve
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true, completion: nil)
                    
                }
            }
            
            self?.dismissIndicator()
        }
   
    }
    
}
