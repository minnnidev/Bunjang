//
//  TabBarViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/21.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }
    
}
