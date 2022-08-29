//
//  TalkViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/29.
//

import UIKit
import PanModal

class TalkViewController: UIViewController {
    @IBOutlet weak var allTalkLabel: UILabel!
    @IBOutlet weak var settingLabelButton: UIButton!

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
          
        self.settingLabelButton.setUnderline()
    }
    
    

   

}
