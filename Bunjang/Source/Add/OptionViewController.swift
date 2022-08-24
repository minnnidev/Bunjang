//
//  OptionViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/21.
//

import UIKit
import PanModal

protocol OptionViewDelegate: AnyObject {
    func sendData(_ option: Option)
}

class OptionViewController: UIViewController {
    @IBOutlet weak var productNumbers: UITextField!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var oldButton: UIButton!
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var exchangeNoButton: UIButton!
    @IBOutlet weak var exchangeYesButton: UIButton!
    
    var isOldText = "중고상품"
    var isExchangePossibleText = "교환불가"
    var option: Option?
    weak var delegate: OptionViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
          
    }
    
    private func configureView() {
        self.completeButton.layer.cornerRadius = 8
        
        oldButton.layer.cornerRadius = 5
        newButton.layer.cornerRadius = 5
        exchangeNoButton.layer.cornerRadius = 5
        exchangeYesButton.layer.cornerRadius = 5
        
        newButton.layer.borderColor = UIColor.borderGrayColor.cgColor
        newButton.layer.borderWidth = 1
        
        exchangeYesButton.layer.borderColor = UIColor.borderGrayColor.cgColor
        exchangeYesButton.layer.borderWidth = 1
    }
    
    
    @IBAction func tapCompleteButton(_ sender: UIButton) {
        guard let stock = self.productNumbers.text else {return}
        
        self.option = Option(stock: stock, isOldText: isOldText, isExchangePossibleText: isExchangePossibleText)
        guard let option = self.option else {return}
        
        self.delegate?.sendData(option)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapOldButton(_ sender: UIButton) {
        self.isOldText = "중고상품"
        
        self.oldButton.optionSelected()
        self.newButton.optionDeselected()
    }
    
    @IBAction func tapNewButton(_ sender: UIButton) {
        self.isOldText = "새상품"
        
        self.newButton.optionSelected()
        self.oldButton.optionDeselected()
    }
    
    
    @IBAction func tapNoExchangeButton(_ sender: UIButton) {
        self.isExchangePossibleText = "교환불가"
        
        self.exchangeNoButton.optionSelected()
        self.exchangeYesButton.optionDeselected()
    }
    
    
    @IBAction func tapYesExchangeButton(_ sender: UIButton) {
        self.isExchangePossibleText = "교환가능"
        
        self.exchangeYesButton.optionSelected()
        self.exchangeNoButton.optionDeselected()
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
