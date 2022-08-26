//
//  DescriptionViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import UIKit
import PanModal

protocol DescriptionViewDelegate: AnyObject {
    func sendDescription(description: String)
}

class DescriptionViewController: UIViewController {
    @IBOutlet weak var contentView: UITextView!
    
    weak var delegate: DescriptionViewDelegate?
    var content: String?
    
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //키보드가 바로 올라오도록
        self.contentView.becomeFirstResponder()
        
        guard let content = self.content else {return}
        self.contentView.text = content
    }

    
//MARK: - Action
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tapCompleteButton(_ sender: UIButton) {
        guard let description = self.contentView.text else {return}
        self.delegate?.sendDescription(description: description)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


//MARK: - Extension
extension DescriptionViewController: PanModalPresentable {
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
