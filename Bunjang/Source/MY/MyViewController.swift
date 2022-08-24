//
//  MyViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/22.
//

import UIKit
import Kingfisher

class MyViewController: UIViewController {
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storeInquiryButton: UIButton!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var wishLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var profileView: UIView!
    
    
    let tapMyDataManager = TapMyDataManager()
    var tapMyResponse: TapMyResponse?
    
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
        self.dataFetch()
        
        let tapProfileGesture = UITapGestureRecognizer(target: self, action: #selector(tapProfileView))
        self.profileView.addGestureRecognizer(tapProfileGesture)

    }
    
//MARK: - selector function
    @objc func tapProfileView() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StateChangeViewController") as! StateChangeViewController
        self.presentPanModal(vc)
    }
    
    
//MARK: - private function
    private func dataFetch() {
        
        //로그인 시 userIdx 받아옴
        tapMyDataManager.sendData(userIdx: 1) { [weak self] response in
            self?.tapMyResponse = response
            guard let url = self?.tapMyResponse?.storeImage else {return}
            
            let realURL = URL(string: url)
            
            DispatchQueue.main.async {
                self?.storeNameLabel.text = self?.tapMyResponse?.storeName
                self?.storeImageView.kf.setImage(with: realURL)
                self?.wishLabel.text = self?.tapMyResponse?.wishLists
                self?.reviewLabel.text = self?.tapMyResponse?.reviews
                self?.followerLabel.text = self?.tapMyResponse?.followers
                self?.followingLabel.text = self?.tapMyResponse?.followers
            }
        }
    }
    
    private func configureView() {
        self.storeImageView.layer.cornerRadius = self.storeImageView.frame.width/2
        self.storeImageView.layer.shadowOpacity = 0.1
        self.storeImageView.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.storeImageView.layer.masksToBounds = false
        self.storeImageView.clipsToBounds = true

        self.storeInquiryButton.layer.borderColor = UIColor(red: 235/255, green: 233/255, blue: 242/255, alpha: 1.0).cgColor
        self.storeInquiryButton.layer.borderWidth = 1
        self.storeInquiryButton.layer.cornerRadius = 10
    }
}
