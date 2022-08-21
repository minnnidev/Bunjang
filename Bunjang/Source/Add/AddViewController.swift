//
//  AddViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/21.
//

import UIKit
import PanModal

class AddViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var selectCategoryView: UIView!
    @IBOutlet weak var selectTagView: UIView!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var selectOptionButton: UIButton!
    @IBOutlet weak var contentTextField: UITextView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var bungaePayDetailButton: UIButton!
    @IBOutlet weak var bungaePayButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        
    }
    
    private func configureView() {
        self.nameTextField.setRegisterTextField(text: "상품명")
        self.priceTextField.setRegisterTextField(text: "가격")
        
        self.selectOptionButton.layer.borderColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1.0).cgColor
        self.selectOptionButton.layer.borderWidth = 1
        self.selectOptionButton.layer.cornerRadius = 8
        
        self.bungaePayButton.layer.borderColor = UIColor.red.cgColor
        self.bungaePayButton.layer.borderWidth = 1
        self.bungaePayButton.layer.cornerRadius = 8
        
        self.registerButton.layer.cornerRadius = 8
        
        self.bungaePayDetailButton.setUnderline()
    }
    
    
    @IBAction func tapSelectOptionButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OptionViewController") as! OptionViewController
        self.presentPanModal(vc)
    }
    
}


