//
//  ModifyViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/25.
//

import UIKit
import PanModal
import Kingfisher

class ModifyViewController: UIViewController {
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var policyView: UIView!
    @IBOutlet weak var precautionView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var policyLabel: UILabel!
    @IBOutlet weak var precautionLabel: UILabel!
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var viewDetailButton: UIButton!
    @IBOutlet weak var storeNameTextField: UITextField!
    @IBOutlet weak var storeAddressTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var backgroundScrollView: UIScrollView!
    
    var userIdx: Int?
    let viewStoreDataManager = ViewStoreDataManager()
    var viewStoreResponse: ViewStoreResponse?
    let modifyInfoDataManager = ModifyInfoDataManager()
    
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGesture()
        self.configureView()
        
        guard let userIdx = self.userIdx else {return}
        
        viewStoreDataManager.getData(userIdx: String(userIdx)) { response in
            let url = URL(string: response.storeImage)
            self.storeImageView.kf.setImage(with: url)
            
            self.storeNameTextField.text = response.storeName
            self.descriptionLabel.text = response.description
            self.policyLabel.text = response.policy
            self.precautionLabel.text = response.precaution
        }
    }
    
//MARK: - private function
    private func setGesture() {
        let firstGesture = UITapGestureRecognizer(target: self, action: #selector(tapFirst))
        self.descriptionView.addGestureRecognizer(firstGesture)
        
        let secondGesture = UITapGestureRecognizer(target: self, action: #selector(tapSecond))
        self.policyView.addGestureRecognizer(secondGesture)
        
        let thirdGesture = UITapGestureRecognizer(target: self, action: #selector(tapThird))
        self.precautionView.addGestureRecognizer(thirdGesture)
    }
    
    private func configureView() {
        self.storeImageView.layer.cornerRadius = self.storeImageView.frame.width/2
        self.viewDetailButton.setUnderline()
        
        self.backgroundScrollView.delegate = self
    }
    
//MARK: - objc function
    @objc func tapFirst() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
        vc.delegate = self
        vc.content = self.descriptionLabel.text
        self.presentPanModal(vc)
    }
    
    @objc func tapSecond() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PolicyViewController") as! PolicyViewController
        vc.delegate = self
        vc.content = self.policyLabel.text
        self.presentPanModal(vc)
    }

    @objc func tapThird() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PrecautionViewController") as! PrecautionViewController
        vc.delegate = self
        vc.content = self.precautionLabel.text
        self.presentPanModal(vc)
    }
    
//MARK: - Action
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tapCompleteButton(_ sender: UIButton) {
        //저장 - Patch - String들
        guard let userIdx = self.userIdx else {return}
        guard let storeName = self.storeNameTextField.text else {return}
        guard let description = self.descriptionLabel.text else {return}
        guard let policy = self.policyLabel.text else {return}
        guard let precaution = self.precautionLabel.text else {return}
    
        let parameters = [
            "storeName": storeName,
            "description": description,
            "policy": policy,
            "precaution": precaution
        ]
        
        modifyInfoDataManager.patchInfoString(userIdx: 1, parameters: parameters) { response in
            print("수정한 부분 patch")
            self.dismiss(animated: true, completion: nil)
        }
    } 
    
}

//MARK: - Extension
extension ModifyViewController: DescriptionViewDelegate, PolicyViewDelegate, PrecautionViewDelegate {
    
    func sendDescription(description: String) {
        self.descriptionLabel.text = description
        self.descriptionLabel.textColor = .darkGray
    }
    
    func sendPolicy(policy: String) {
        self.policyLabel.text = policy
        self.policyLabel.textColor = .darkGray
    }
    
    func sendPrecaution(precaution: String) {
        self.precautionLabel.text = precaution
        self.precautionLabel.textColor = .darkGray
    }
}

extension ModifyViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
}
