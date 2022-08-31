//
//  MessageCertificationViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/31.
//

import UIKit

class MessageCertificationViewController: UIViewController {
    @IBOutlet weak var numberTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()

        self.navigationItem.hidesBackButton = true
        
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: nil)
        button.tintColor = .black
        self.navigationItem.leftBarButtonItems = [button]
    }
    
    private func configureView() {
        self.numberTextField.becomeFirstResponder()
    }
}
