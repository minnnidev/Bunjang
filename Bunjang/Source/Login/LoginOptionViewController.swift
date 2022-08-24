//
//  LoginOptionViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/24.
//

import UIKit
import PanModal

//MARK: - protocol
protocol LoginOptionDelegate: AnyObject {
    func sendComplete(_ loginComplete: Bool)
}

class LoginOptionViewController: UIViewController {
    @IBOutlet weak var authenticationView: UIView!
    weak var delegate: LoginOptionDelegate?

//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thirdButtonGesture = UITapGestureRecognizer(target: self, action: #selector(tapThirdButton))
        self.authenticationView.addGestureRecognizer(thirdButtonGesture)
    }
    
//MARK: - selector function
    @objc func tapThirdButton() {
        self.delegate?.sendComplete(true)
        self.dismiss(animated: true)
    }
}

//MARK: - Extension
extension LoginOptionViewController: PanModalPresentable {
       var panScrollable: UIScrollView? {
           return nil
       }

       var shortFormHeight: PanModalHeight {
           return .contentHeight(300)
       }

       var longFormHeight: PanModalHeight {
           return .maxHeightWithTopInset(0)
       }
}
