//
//  TransactionOptionViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/24.
//

import UIKit
import PanModal
import DLRadioButton

enum DeliveryOption {
    case post //택배
    case direct //직거래
}

protocol DeliveryViewDelegate: AnyObject {
    func sendDelivery(_ delivery: DeliveryOption, _ isDeleverySelected: Bool)
}

class TransactionOptionViewController: UIViewController {
    @IBOutlet weak var postViewButton: UIView!
    @IBOutlet weak var directViewButton: UIView!
    @IBOutlet weak var postButton: DLRadioButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var directButton: DLRadioButton!
    @IBOutlet weak var bungaePayDetailButton: UIButton!
    
    weak var delegate: DeliveryViewDelegate?
    var delivery: DeliveryOption = .post
    
//MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
//MARK: - Private function
    private func configureView() {
        self.bungaePayDetailButton.setUnderline()
        self.nextButton.layer.cornerRadius = 8
        self.postViewButton.layer.cornerRadius = 8
        self.directViewButton.layer.cornerRadius = 8
        
        self.postViewButton.layer.borderWidth = 1
        self.postViewButton.layer.borderColor = UIColor.mainRedColor.cgColor
        
        self.directViewButton.layer.borderWidth = 1
        self.directViewButton.layer.borderColor = UIColor(red: 228/255, green: 227/255, blue: 228/255, alpha: 1.0).cgColor
        
        //default - 택배 거래
        self.postButton.isSelected = true
        
        let postGesture = UITapGestureRecognizer(target: self, action: #selector(tapPostViewButton))
        self.postViewButton.addGestureRecognizer(postGesture)
        
        let directGesture = UITapGestureRecognizer(target: self, action: #selector(tapDirectViewButton))
        self.directViewButton.addGestureRecognizer(directGesture)
    }


//MARK: - selector function
    @objc func tapPostViewButton() {
        self.postButton.isSelected = true
        self.postViewButton.layer.borderColor = UIColor.mainRedColor.cgColor
        self.directViewButton.layer.borderColor = UIColor.borderGrayColor.cgColor
        
        self.delivery = .post
    }
    
    @objc func tapDirectViewButton() {
        self.directButton.isSelected = true
        self.directViewButton.layer.borderColor = UIColor.mainRedColor.cgColor
        self.postViewButton.layer.borderColor = UIColor.borderGrayColor.cgColor
        
        self.delivery = .direct
    }
    

//MARK: - Action
    @IBAction func tapPostButton(_ sender: DLRadioButton) {
        self.postButton.isSelected = true
        self.postViewButton.layer.borderColor = UIColor.mainRedColor.cgColor
        self.directViewButton.layer.borderColor = UIColor.borderGrayColor.cgColor
        
        self.delivery = .post
    }
    
    
    @IBAction func tapDirectButton(_ sender: DLRadioButton) {
        self.directButton.isSelected = true
        self.directViewButton.layer.borderColor = UIColor.mainRedColor.cgColor
        self.postViewButton.layer.borderColor = UIColor.borderGrayColor.cgColor
        
        self.delivery = .direct
    }
    
    
    @IBAction func tapNextButton(_ sender: UIButton) {
        self.delegate?.sendDelivery(self.delivery, true)
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - Extension: PanModalPresentable
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
