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
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let index = tabBarController.viewControllers?.index(of: viewController)
        
        if index == 1 {
            /*
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
            self.navigationController?.pushViewController(vc, animated: true)
             */
            return true
            
        } else if (index == 2) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddNavigationViewController") as! AddNavigationViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            return false
        } else {
            return true
        }
        
    }
    
}
