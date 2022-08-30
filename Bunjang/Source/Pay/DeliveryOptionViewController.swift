//
//  DeliveryOptionViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/30.
//

import UIKit
import PanModal

protocol MessageViewDelegate: AnyObject {
    func sendMessage(_ messageEnum: Message)
}

enum Message: String {
    case door = "문앞"
    case directAndDoor = "직접 받고 부재 시 문앞"
    case office = "경비실"
    case mailBox = "우편함"
    case inputDirectly = "직접입력"
}

class DeliveryOptionViewController: UIViewController {
    @IBOutlet weak var doorButton: UIButton!
    @IBOutlet weak var directAndDoorButton: UIButton!
    @IBOutlet weak var officeButton: UIButton!
    @IBOutlet weak var mailBoxButton: UIButton!
    @IBOutlet weak var inputDirectlyButton: UIButton!
    
    var message: Message = .inputDirectly
    weak var delegate: MessageViewDelegate?
    
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch message {
        case .door:
            self.doorButton.filterSelected()
        case .directAndDoor:
            self.directAndDoorButton.filterSelected()
        case .office:
            self.officeButton.filterSelected()
        case .mailBox:
            self.mailBoxButton.filterSelected()
        case .inputDirectly:
            self.inputDirectlyButton.filterSelected()
        }
    }
    
//MARK: - Action
    
    @IBAction func tapDoorButton(_ sender: UIButton) {
        message = .door
        
        self.doorButton.filterSelected()
        self.directAndDoorButton.filterDeselected()
        self.officeButton.filterDeselected()
        self.mailBoxButton.filterDeselected()
        self.inputDirectlyButton.filterDeselected()
        
        self.delegate?.sendMessage(self.message)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapDirectAndDoorButton(_ sender: UIButton) {
        message = .directAndDoor
        
        self.doorButton.filterDeselected()
        self.directAndDoorButton.filterSelected()
        self.officeButton.filterDeselected()
        self.mailBoxButton.filterDeselected()
        self.inputDirectlyButton.filterDeselected()
        
        self.delegate?.sendMessage(self.message)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapOfficeButton(_ sender: UIButton) {
        message = .office
        
        self.doorButton.filterDeselected()
        self.directAndDoorButton.filterDeselected()
        self.officeButton.filterSelected()
        self.mailBoxButton.filterDeselected()
        self.inputDirectlyButton.filterDeselected()
        
        self.delegate?.sendMessage(self.message)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapMailBoxButton(_ sender: UIButton) {
        message = .mailBox
        
        self.doorButton.filterDeselected()
        self.directAndDoorButton.filterDeselected()
        self.officeButton.filterDeselected()
        self.mailBoxButton.filterSelected()
        self.inputDirectlyButton.filterDeselected()
        
        self.delegate?.sendMessage(self.message)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tapInputDirectlyButton(_ sender: UIButton) {
        message = .inputDirectly
        
        self.doorButton.filterDeselected()
        self.directAndDoorButton.filterDeselected()
        self.officeButton.filterDeselected()
        self.mailBoxButton.filterDeselected()
        self.inputDirectlyButton.filterSelected()
        
        self.delegate?.sendMessage(self.message)
        self.dismiss(animated: true, completion: nil)
    }
    
}

//MARK: - Extension: PanModalPresentable
extension DeliveryOptionViewController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }

    var shortFormHeight: PanModalHeight {
        return .contentHeight(300)
    }

    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(0)
    }
}
