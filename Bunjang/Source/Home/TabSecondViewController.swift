//
//  TabSecondViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/20.
//

import UIKit

class TabSecondViewController: UIViewController {
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var viewBrandButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        
    }
    
    private func configureView() {
        self.addButton.layer.cornerRadius = 18
        self.editButton.layer.cornerRadius = 18
        self.viewBrandButton.layer.cornerRadius = 7
    }
    

}
