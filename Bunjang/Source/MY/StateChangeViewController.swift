 //
//  StateChangeViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/23.
//

import UIKit
import PanModal

enum ProfileState {
    case modify
    case preview
    case none
}

protocol StateChangeViewDelegate: AnyObject {
    func sendComplete(_ profileState: ProfileState)
}

class StateChangeViewController: UIViewController {
    weak var delegate: StateChangeViewDelegate?
    var profileState : ProfileState  = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapModifyButton(_ sender: UIButton) {
        self.profileState = .modify
        self.delegate?.sendComplete(self.profileState)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tapPreviewButton(_ sender: UIButton) {
        self.profileState = .preview
        self.delegate?.sendComplete(self.profileState)
        self.dismiss(animated: true, completion: nil)
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
