//
//  CarrierViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/31.
//

import UIKit
import PanModal
import DLRadioButton

enum Carrier: String {
    case SKT = "SKT"
    case KT = "KT"
    case LG = "LG U+"
    case SKTSecond = "SKT 알뜰폰"
    case KTSecond = "KT 알뜰폰"
    case LGSecond = "LG U+ 알뜰폰"
}

protocol CarrierViewDelegate: AnyObject {
    func sendCarrier(_ carrier: Carrier)
}

class CarrierViewController: UIViewController {
    
    var carrier: Carrier = .SKT
    weak var delegate: CarrierViewDelegate?

//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//MARK: - Action
    @IBAction func tapSKT(_ sender: UIButton) {
        self.carrier = .SKT
        self.delegate?.sendCarrier(self.carrier)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapKT(_ sender: UIButton) {
        self.carrier = .KT
        self.delegate?.sendCarrier(self.carrier)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapLG(_ sender: UIButton) {
        self.carrier = .LG
        self.delegate?.sendCarrier(self.carrier)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapSKTSecond(_ sender: UIButton) {
        self.carrier = .SKTSecond
        self.delegate?.sendCarrier(self.carrier)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapKTSecond(_ sender: UIButton) {
        self.carrier = .KTSecond
        self.delegate?.sendCarrier(self.carrier)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapLGSecond(_ sender: UIButton) {
        self.carrier = .LGSecond
        self.delegate?.sendCarrier(self.carrier)
        self.dismiss(animated: true, completion: nil)
    }
}
 
//MARK: - Extension
extension CarrierViewController: PanModalPresentable {
       var panScrollable: UIScrollView? {
           return nil
       }

       var shortFormHeight: PanModalHeight {
           return .contentHeight(350)
       }

       var longFormHeight: PanModalHeight {
           return .maxHeightWithTopInset(0)
       }
}
