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
        
        newButton.layer.borderColor = UIColor(red: 228/255, green: 227/255, blue: 228/255, alpha: 1.0).cgColor
        newButton.layer.borderWidth = 1
        
        exchangeYesButton.layer.borderColor = UIColor(red: 228/255, green: 227/255, blue: 228/255, alpha: 1.0).cgColor
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
        
        self.oldButton.backgroundColor = UIColor(red: 255/255, green: 238/255, blue: 240/255, alpha: 1.0)
        self.oldButton.setTitleColor(.red, for: .normal)
        
        self.newButton.backgroundColor = .white
        self.newButton.setTitleColor(.lightGray, for: .normal)
    }
    
    @IBAction func tapNewButton(_ sender: UIButton) {
        self.isOldText = "새상품"
        
        /*
        self.newButton.backgroundColor = UIColor(red: 255/255, green: 238/255, blue: 240/255, alpha: 1.0)
        self.newButton.setTitleColor(.red, for: .normal)
        
        self.oldButton.backgroundColor = .white
        self.oldButton.setTitleColor(.lightGray, for: .normal)
         */
        
        self.newButton.optionSelected()
        self.oldButton.optionDeselected()
    }
    
    
    @IBAction func tapNoExchangeButton(_ sender: UIButton) {
        self.isExchangePossibleText = "교환불가"
        
        /*
        self.exchangeNoButton.backgroundColor = UIColor(red: 255/255, green: 238/255, blue: 240/255, alpha: 1.0)
        self.exchangeNoButton.setTitleColor(.red, for: .normal)
        
        self.exchangeYesButton.backgroundColor = .white
        self.exchangeYesButton.setTitleColor(.lightGray, for: .normal)
         */
    }
    
    
    @IBAction func tapYesExchangeButton(_ sender: UIButton) {
        self.isExchangePossibleText = "교환가능"
        
        self.exchangeYesButton.backgroundColor = UIColor(red: 255/255, green: 238/255, blue: 240/255, alpha: 1.0)
        self.exchangeYesButton.setTitleColor(.red, for: .normal)
        
        self.exchangeNoButton.backgroundColor = .white
        self.exchangeNoButton.setTitleColor(.lightGray, for: .normal)
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
