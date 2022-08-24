//
//  SecondLoginViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/24.
//

import UIKit

class SecondLoginViewController: UIViewController {
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var firstTextFieldView: UIView!
    
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var secondTextFieldView: UIView!
    
    @IBOutlet weak var thirdTextField: UITextField!
    
    let signInDataManager = SignInDataManager()
    let nextButton = UIButton()


//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        
        self.secondTextField.delegate = self
        self.thirdTextField.delegate = self
    }
    
//MARK: - private function
    private func configureView() {
        
        //키보드 위의 button 만들기
        nextButton.isEnabled = false
        nextButton.backgroundColor = UIColor(red: 255/255, green: 225/255, blue: 223/255, alpha: 1.0)
        nextButton.setTitle("다음", for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        self.firstTextField.inputAccessoryView = nextButton
    
        //firstTextField 내용 작성 시 키보드 위 다음 버튼 활성화
        firstTextField.addTarget(self, action: #selector(validateTest), for: .editingChanged)
        
        //다음 버튼 누를 시 다음 textField로 responder 설정
        nextButton.addTarget(self, action: #selector(tapNextButton), for: .touchUpInside)
        
        // UITextViewDelegate 사용
        self.secondTextField.delegate = self
    }
   
    
//MARK: - selector function
    @objc func validateTest() {
        nextButton.isEnabled = true
        nextButton.backgroundColor = .red
    }
    
    @objc func tapNextButton() {
        self.secondTextField.becomeFirstResponder()
    }
    
    
//MARK: - Action
    @IBAction func signInButton(_ sender: UIButton) {
        guard let loginId = self.firstTextField.text else {return}
        guard let password = self.secondTextField.text else {return}
        guard let storeName = self.thirdTextField.text else {return}
        
        let input = SignInRequest(loginId: loginId, password: password, storeName: storeName)
        signInDataManager.postData(parameters: input)
    }
    
}


//MARK: - Extension
extension SecondLoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
