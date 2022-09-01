//
//  StorePreviewViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import UIKit

class StorePreviewViewController: UIViewController {
    
//MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//MARK: - Action
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
