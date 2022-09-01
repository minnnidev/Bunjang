//
//  PayViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/30.
//

import UIKit
import DLRadioButton
import Kingfisher
import PanModal

class PayPostViewController: UIViewController {
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var messageInputView: UIView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var pointView: UIView!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var simplePayBanner: UIImageView!
    @IBOutlet weak var simplePayButton: DLRadioButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var seeAllButton: UIButton!
    @IBOutlet weak var seeDetailButton: UIButton!
    @IBOutlet weak var BGZTbutton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var bannerView: UIImageView!
    @IBOutlet weak var eventBannerView: UIImageView!
    
    
    //item
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    //pay
    @IBOutlet weak var payPriceLabel: UILabel!
    @IBOutlet weak var shippingFeeLabel: UILabel!
    @IBOutlet weak var finalPayLabel: UILabel!
    @IBOutlet weak var payOptionLabel: UILabel!
    
    
    
    var isAgree = false
    var itemIdx: String?
    var itemDataManager = EachItemDataManager()
    var messageEnum: Message = .inputDirectly

     
    
//MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        switch messageEnum {
            case .inputDirectly:
                self.messageView.isHidden = false
            default:
                self.messageView.isHidden = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.fetchData()
        self.setGesture()
    }
    
//MARK: - private function
    private func fetchData() {
        guard let itemIdx = self.itemIdx else {return}
        
        self.showIndicator()
        itemDataManager.getData(itemIdx: itemIdx) { response in
            self.itemPriceLabel.text = response.result.price
            self.itemNameLabel.text = response.result.name
            self.payPriceLabel.text = response.result.price
            self.finalPayLabel.text = response.result.price
            
            if response.result.delivery {
                //배송비 포함
                self.shippingFeeLabel.text = "배송비포함"
            } else {
                //배송비별도
                self.shippingFeeLabel.text = "배송비별도"
            }
            
            let url = URL(string: response.result.images[0])
            self.itemImageView.kf.setImage(with: url)
            
            self.dismissIndicator()
        }
    }
    
    private func setGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapMessagInput))
        self.messageInputView.addGestureRecognizer(gesture)
        
        let payGestrue = UITapGestureRecognizer(target: self, action: #selector(tapRegisterButton))
        self.registerView.addGestureRecognizer(payGestrue)
    }
    
    
    private func configureView() {
        self.addressView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.addressView.layer.borderWidth = 1
        self.addressView.layer.cornerRadius = 5
        
        self.messageInputView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.messageInputView.layer.borderWidth = 1
        self.messageInputView.layer.cornerRadius = 5
        
        self.messageView.layer.cornerRadius = 5
        
        self.pointView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.pointView.layer.borderWidth = 1
        self.pointView.layer.cornerRadius = 5
        
        self.priceView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.priceView.layer.borderWidth = 1
        self.priceView.layer.cornerRadius = 5
        
        self.registerView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.registerView.layer.borderWidth = 1
        self.registerView.layer.cornerRadius = 5
        
        self.simplePayBanner.layer.cornerRadius = 5
        
        self.simplePayButton.isSelected = true
        self.registerButton.setUnderline()
        
        self.seeAllButton.setUnderline()
        self.seeDetailButton.setUnderline()
        
        self.payButton.layer.cornerRadius = 5
        self.bannerView.layer.cornerRadius = 5
        self.eventBannerView.layer.cornerRadius = 5
    
    }
    
//MARK: - objc function
    @objc func tapMessagInput() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DeliveryOptionViewController") as! DeliveryOptionViewController
        vc.delegate = self
        vc.message = self.messageEnum
        self.presentPanModal(vc)
    }
    
    @objc func tapRegisterButton() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PayOptionViewController") as! PayOptionViewController
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//MARK: - Action
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func tapAgreeButton(_ sender: UIButton) {
        if isAgree {
            isAgree = false
            self.BGZTbutton.tintColor = .lightGray
        } else {
            isAgree = true
            self.BGZTbutton.tintColor = .mainRedColor
        }
    }
    
    @IBAction func tapPayButton(_ sender: UIButton) {
        //self.presentAlert(title: "구매 완료되었습니다")
        
        if isAgree {
            let alert = UIAlertController(title: "구매 성공", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                self.navigationController?.popToRootViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: {})
            
        } else {
            self.presentAlert(title: "약관 동의가 필요합니다")
        }
    }
}

extension PayPostViewController: MessageViewDelegate {
    func sendMessage(_ messageEnum: Message) {
        self.messageLabel.text = messageEnum.rawValue
        self.messageEnum = messageEnum
    }
}

extension PayPostViewController: PayOptionDelegate {
    func sendPayOption(_ payOption: PayOption) {
        self.payOptionLabel.text = payOption.rawValue
        self.payOptionLabel.font = .systemFont(ofSize: 18)
        self.payOptionLabel.textColor = .black
    }
}


