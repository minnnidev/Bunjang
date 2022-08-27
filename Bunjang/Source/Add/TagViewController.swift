//
//  TagViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/27.
//

import UIKit

protocol TagViewDelegate: AnyObject {
    func sendTags(_ tags: [String])
}

class TagViewController: UIViewController {
    @IBOutlet weak var tagTextField: UITextField!
    
    var tags: [String] = []
    weak var delegate: TagViewDelegate?
    
//MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
//MARK: - Action
    @IBAction func tapAddTagButton(_ sender: UIButton) {
        guard let tag = self.tagTextField.text else {return}
        self.tags.append(tag)
        
        self.tagTextField.text = ""
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.delegate?.sendTags(self.tags)
        self.navigationController?.popViewController(animated: true)
    }
    
}
