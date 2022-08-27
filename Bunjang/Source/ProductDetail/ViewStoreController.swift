//
//  ViewStoreController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/28.
//

import UIKit

class ViewStoreController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
