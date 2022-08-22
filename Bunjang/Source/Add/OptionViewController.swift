//
//  OptionViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/21.
//

import UIKit
import PanModal

protocol SendOption: AnyObject {
    func sendData(_ option: Option)
}

class OptionViewController: UIViewController {
    @IBOutlet weak var productNumbers: UITextField!
    @IBOutlet weak var conditionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var exchangeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var completeButton: UIButton!
    
    var option: Option?
    weak var delegate: SendOption?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.completeButton.layer.cornerRadius = 8
    }
    
    
    @IBAction func tapCompleteButton(_ sender: UIButton) {
        //중고 상품일 때 - 0(false) , 교환 가능할 때 - 1(true)
        var isOldText = ""
        var isExchangePossibleText = ""
        guard let quantity = self.productNumbers.text else {return}
        
        if conditionSegmentedControl.selectedSegmentIndex == 0 {
            isOldText = "중고상품"
        } else {
            isOldText = "새상품"
        }
        
        if exchangeSegmentedControl.selectedSegmentIndex == 0 {
            isExchangePossibleText = "불가"
        } else {
            isExchangePossibleText = "가능"
        }
        
        option = Option(quantity: quantity, isOldText: isOldText, isExchangePossibleText: isExchangePossibleText)
        guard let option = option else {return}
        self.delegate?.sendData(option)
        self.dismiss(animated: true, completion: nil)
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
