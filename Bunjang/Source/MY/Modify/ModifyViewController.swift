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
    
    
    
    var userIdx: Int?
    let viewStoreDataManager = ViewStoreDataManager()
    var viewStoreResponse: ViewStoreResponse?
    
    
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
        //저장 - Patch
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
