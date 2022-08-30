//
//  PayDirectViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/30.
//

import UIKit

class PayDirectViewController: UIViewController {
    
//MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
//MARK: - Action
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
