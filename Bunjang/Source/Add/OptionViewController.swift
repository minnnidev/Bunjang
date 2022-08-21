//
//  OptionViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/21.
//

import UIKit
import PanModal

class OptionViewController: UIViewController {
    @IBOutlet weak var productNumbers: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension OptionViewController: PanModalPresentable {
       var panScrollable: UIScrollView? {
           return nil
       }

       var shortFormHeight: PanModalHeight {
           return .contentHeight(400)
       }

       var longFormHeight: PanModalHeight {
           return .maxHeightWithTopInset(0)
       }
}
