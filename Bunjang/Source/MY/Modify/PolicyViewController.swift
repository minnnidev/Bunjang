//
//  PolicyViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import UIKit
import PanModal


protocol PolicyViewDelegate: AnyObject {
    func sendPolicy(policy: String)
}

class PolicyViewController: UIViewController {
    @IBOutlet weak var contentView: UITextView!
    
    weak var delegate: PolicyViewDelegate?
    var content: String?
    
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.contentView.becomeFirstResponder()
        guard let content = self.content else {return}
        self.contentView.text = content
    }
    
//MARK: - Action
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapCompleteButton(_ sender: UIButton) {
        guard let policy = self.contentView.text else {return}
        self.delegate?.sendPolicy(policy: policy)
        
        self.dismiss(animated: true, completion: nil)
    }
    
}

//MARK: - Extension
extension PolicyViewController: PanModalPresentable {
       var panScrollable: UIScrollView? {
           return nil
       }

       var shortFormHeight: PanModalHeight {
           return .contentHeight(600)
       }

       var longFormHeight: PanModalHeight {
           return .maxHeightWithTopInset(0)
       }
}
