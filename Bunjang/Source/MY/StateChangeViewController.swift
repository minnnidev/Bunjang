 //
//  StateChangeViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/23.
//

import UIKit
import PanModal

class StateChangeViewController: UIViewController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension StateChangeViewController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }

    var shortFormHeight: PanModalHeight {
        return .contentHeight(280)
    }

    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(0)
    }
}
