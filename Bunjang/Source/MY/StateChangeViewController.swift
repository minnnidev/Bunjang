 //
//  StateChangeViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/23.
//

import UIKit
import PanModal

protocol StateChangeViewDelegate: AnyObject {
    func sendComplete(_ modifyOption: Bool)
}

class StateChangeViewController: UIViewController {
    weak var delegate: StateChangeViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapModifyButton(_ sender: UIButton) {
        self.delegate?.sendComplete(true)
        self.dismiss(animated: true, completion: nil)
        
        /*
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ModifyViewController") as! ModifyViewController
        self.present(vc, animated: true, completion: nil)
         */
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
