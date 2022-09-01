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
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var followerLabel: UILabel!
    
    
    //info
    @IBOutlet weak var followingView: UIStackView!
    @IBOutlet weak var followerView: UIStackView!
    
    
    let tapMyDataManager = TapMyDataManager()
    var tapMyResponse: TapMyResponse?
    //var modifyOption = false
    var userIdx: String?
    var profileState: ProfileState = .none
    
//MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.dataFetch()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
        self.dataFetch()
        self.setGesture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /*
        if modifyOption {
            guard let userIdx = self.userIdx else {return}
            
            modifyOption = false
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ModifyViewController") as! ModifyViewController
            vc.modalPresentationStyle = .fullScreen
            vc.userIdx = userIdx
            self.present(vc, animated: true, completion: nil)
        }
         */
        
        switch profileState {
            case .modify:
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ModifyViewController") as! ModifyViewController
                vc.modalPresentationStyle = .fullScreen
                vc.userIdx = userIdx
                self.profileState = .none
                self.present(vc, animated: true, completion: nil)
            case .preview:
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewStoreController") as! ViewStoreController
                vc.modalPresentationStyle = .fullScreen
                vc.isPreview = true
                vc.seller = self.userIdx
                self.profileState = .none
                self.navigationController?.pushViewController(vc, animated: true)
            case .none:
                print("아무 동작도 일어나지 않음")
        }
    }
    
    
//MARK: - selector function
    @objc func tapProfileView() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StateChangeViewController") as! StateChangeViewController
        vc.delegate = self
        self.presentPanModal(vc)
    }
    
    @objc func tapFollower() {
        guard let userIdx = self.userIdx else {return}
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FollowerViewController") as! FollowerViewController
        vc.userIdx = userIdx
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tapFollowing() {
        guard let userIdx = self.userIdx else {return}
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FollowingViewController") as! FollowingViewController
        vc.userIdx = userIdx
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
//MARK: - private function
    private func dataFetch() {
        //로그인 시 userIdx 받아옴
        self.showIndicator()
        
        tapMyDataManager.sendData { [weak self] response in
            self?.tapMyResponse = response
            guard let url = self?.tapMyResponse?.storeImage else {return}
            
            let realURL = URL(string: url)
            
            DispatchQueue.main.async {
                self?.storeNameLabel.text = self?.tapMyResponse?.storeName
                self?.storeImageView.kf.setImage(with: realURL)
                self?.wishLabel.text = self?.tapMyResponse?.wishLists
                self?.reviewLabel.text = self?.tapMyResponse?.reviews
                self?.followerLabel.text = self?.tapMyResponse?.followers
                self?.followingLabel.text = self?.tapMyResponse?.followings
                
                self?.userIdx = self?.tapMyResponse?.storeId
                
                self?.dismissIndicator()
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
    
    private func setGesture() {
        let tapProfileGesture = UITapGestureRecognizer(target: self, action: #selector(tapProfileView))
        self.profileView.addGestureRecognizer(tapProfileGesture)
        
        let followerGesture = UITapGestureRecognizer(target: self, action: #selector(tapFollower))
        self.followerView.addGestureRecognizer(followerGesture)
        
        let followingGestrue = UITapGestureRecognizer(target: self, action: #selector(tapFollowing))
        self.followingView.addGestureRecognizer(followingGestrue)
    }
}

extension MyViewController: StateChangeViewDelegate {
    func sendComplete(_ profileState: ProfileState) {
        self.profileState = profileState
    }
}
