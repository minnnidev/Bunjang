//
//  FirstLoginViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/24.
//

import UIKit
import ImageSlideshow
import PanModal
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser


class FirstLoginViewController: UIViewController {
    @IBOutlet weak var loginBannerSlideShow: ImageSlideshow!
    @IBOutlet weak var kakaoLoginImage: UIImageView!
    @IBOutlet weak var appleLoginImage: UIImageView!
    

    var isTapLogin = false
    var bannerImages = [ImageSource(image: UIImage(named: "LoginBanner1")!),
                        ImageSource(image: UIImage(named: "LoginBanner2")!),
                        ImageSource(image: UIImage(named: "LoginBanner3")!),
                        ImageSource(image: UIImage(named: "LoginBanner4")!)]
    
    
//MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isTapLogin {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondLoginViewController") as! SecondLoginViewController
            self.isTapLogin = false
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setBannerImage()
        self.configureView()
        self.setGesture()
    }
    
//MARK: - private function
    private func setBannerImage() {
        //create page indicator
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = .black
        pageIndicator.pageIndicatorTintColor = .lightGray
        self.loginBannerSlideShow.pageIndicator = pageIndicator
        self.loginBannerSlideShow.circular = false
        
        //set image
        self.loginBannerSlideShow.setImageInputs(bannerImages)
    }
    
    private func configureView() {
        self.kakaoLoginImage.layer.cornerRadius = 20
    }
    
    private func setGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapKakaoLogin))
        self.kakaoLoginImage.addGestureRecognizer(gesture)
        
        let appleGesture = UITapGestureRecognizer(target: self, action: #selector(tapAppleLogin))
        self.appleLoginImage.addGestureRecognizer(appleGesture)
    }
    
//MARK: objc funtion
    @objc func tapKakaoLogin() {
        self.presentAlert(title: "카카오 로그인 준비 중입니다")
    }
    
    @objc func tapAppleLogin() {
        self.presentAlert(title: "애플 로그인 준비 중입니다")
    }
    
//MARK: - Action
    @IBAction func tapAnotherLogin(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginOptionViewController") as! LoginOptionViewController
        vc.delegate = self
        self.presentPanModal(vc)
    }
    
}

//MARK: - Extension: LoginOptionDelegate
extension FirstLoginViewController: LoginOptionDelegate {
    func sendComplete(_ loginComplete: Bool) {
        self.isTapLogin = loginComplete
    }
}
