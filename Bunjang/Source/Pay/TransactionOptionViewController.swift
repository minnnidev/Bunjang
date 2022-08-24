//
//  TransactionOptionViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/24.
//

import UIKit
import PanModal
import DLRadioButton

class TransactionOptionViewController: UIViewController {
    @IBOutlet weak var postViewButton: UIView!
    @IBOutlet weak var directViewButton: UIView!
    
    @IBOutlet weak var postButton: DLRadioButton!
    @IBOutlet weak var directButton: DLRadioButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //default - 택배 거래
        self.postButton.isSelected = true
        
        let postGesture = UITapGestureRecognizer(target: self, action: #selector(tapPostViewButton))
        self.postViewButton.addGestureRecognizer(postGesture)
        
        let directGesture = UITapGestureRecognizer(target: self, action: #selector(tapDirectViewButton))
        self.directViewButton.addGestureRecognizer(directGesture)

    }
    
    @objc func tapPostViewButton() {
        self.postButton.isSelected = true
    }
    
    @objc func tapDirectViewButton() {
        self.directButton.isSelected = true
    }
}

extension TransactionOptionViewController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }

    var shortFormHeight: PanModalHeight {
        return .contentHeight(500)
    }

    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(0)
    }
}
