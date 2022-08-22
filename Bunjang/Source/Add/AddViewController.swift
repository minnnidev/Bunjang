//
//  AddViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/21.
//

import UIKit
import PanModal

class AddViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var selectCategoryView: UIView!
    @IBOutlet weak var selectTagView: UIView!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var selectOptionButton: UIButton!
    @IBOutlet weak var contentTextField: UITextView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var bungaePayDetailButton: UIButton!
    @IBOutlet weak var bungaePayButtonView: UIView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var isOldLabel: UILabel!
    @IBOutlet weak var isExchangePossibleLabel: UILabel!
    @IBOutlet weak var checkmark: UIImageView!
    @IBOutlet weak var shippingFeeButton: UIButton!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var goToAlbumButton: UIView!
    @IBOutlet weak var getImageView: UIImageView!
    
    var option: Option?
    var category: String?
    var isBungaePayOK = true
    var isNotIncludeShippingFee = true
    var isCategoryWritten = false
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapCategoryView))
        self.selectCategoryView.addGestureRecognizer(tapGesture)
        
        let payTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapPayView))
        self.bungaePayButtonView.addGestureRecognizer(payTapGesture)
        
        let albumTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAlbumView))
        self.goToAlbumButton.addGestureRecognizer(albumTapGesture)
        
        self.imagePicker.delegate = self
        self.imagePicker.allowsEditing = true
        self.imagePicker.sourceType = .photoLibrary
    }
    
    @objc func tapAlbumView() {
        imagePicker.modalPresentationStyle = .fullScreen
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func tapPayView() {
        if isBungaePayOK {
            isBungaePayOK = false
            self.bungaePayButtonView.layer.borderColor = UIColor.lightGray.cgColor
            checkmark.tintColor = .lightGray
        } else {
            isBungaePayOK = true
            self.bungaePayButtonView.layer.borderColor = UIColor.red.cgColor
            checkmark.tintColor = .red
        }
    }
    
    @objc func tapCategoryView() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        vc.delegate = self
        self.isCategoryWritten = true
        //self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func configureView() {
        self.nameTextField.setRegisterTextField(text: "상품명")
        self.priceTextField.setRegisterTextField(text: "가격")
        
        self.selectOptionButton.layer.borderColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1.0).cgColor
        self.selectOptionButton.layer.borderWidth = 1
        self.selectOptionButton.layer.cornerRadius = 8
        
        self.bungaePayButtonView.layer.borderColor = UIColor.red.cgColor
        self.bungaePayButtonView.layer.borderWidth = 1
        self.bungaePayButtonView.layer.cornerRadius = 8
        
        self.registerButton.layer.cornerRadius = 8
        
        self.bungaePayDetailButton.setUnderline()
    }
    
    
    @IBAction func tapSelectOptionButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OptionViewController") as! OptionViewController
        vc.delegate = self
        self.presentPanModal(vc)
    }
    
    
    @IBAction func tapShippingFee(_ sender: UIButton) {
        if isNotIncludeShippingFee {
            isNotIncludeShippingFee = false
            self.shippingFeeButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            self.shippingFeeButton.tintColor = .red
        } else {
            isNotIncludeShippingFee = true
            self.shippingFeeButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            self.shippingFeeButton.tintColor = .lightGray
        }
    }
}

extension AddViewController: SendOption, SendCategoryDelegate {
    func sendData(_ option: Option) {
        self.option = option
        
        guard let option = self.option else {return}
        self.quantityLabel.text = option.quantity
        self.isOldLabel.text = option.isOldText
        self.isExchangePossibleLabel.text = option.isExchangePossibleText
    }
    
    func sendCategory(_ category: String) {
        self.category = category
        
        guard let category = self.category else {return}
        self.categoryNameLabel.text = category
        
    }
}

extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let newImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        self.getImageView.image = newImage
        self.imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //이미지가 선택되지 않았습니다! 알림창 뜨도록
    }
}
