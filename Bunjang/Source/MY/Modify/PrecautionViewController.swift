//
//  PrecautionViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import UIKit
import PanModal

protocol PrecautionViewDelegate: AnyObject {
    func sendPrecaution(precaution: String)
}

class PrecautionViewController: UIViewController {
    @IBOutlet weak var contentView: UITextView!
    
    weak var delegate: PrecautionViewDelegate?
    var content: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.contentView.becomeFirstResponder()
        
        guard let content = self.content else {return}
        self.contentView.text = content
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tapCompleteButton(_ sender: UIButton) {
        guard let precaution = self.contentView.text else {return}
        self.delegate?.sendPrecaution(precaution: precaution)
        self.dismiss(animated: true, completion: nil)
    }
}



extension PrecautionViewController: PanModalPresentable {
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
