//
//  OptionFilterViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/24.
//

import UIKit
import PanModal

//MARK: - Protocol
protocol OptionFilterViewDelegate: AnyObject {
    func sendData(_ order: Order)
}

//MARK: - Enum
enum Order:String {
    case accuracy = "C"
    case recent = "R"
    case lowPrice = "L"
    case highPrice = "H"
}

class OptionFilterViewController: UIViewController {
    @IBOutlet weak var accuracyButton: UIButton!
    @IBOutlet weak var recentButton: UIButton!
    @IBOutlet weak var lowPriceButton: UIButton!
    @IBOutlet weak var highPriceButton: UIButton!
    @IBOutlet weak var distanceButton: UIButton!
    
    @IBOutlet weak var optionThreeButton: UIButton!
    @IBOutlet weak var optionTwoButton: UIButton!
    @IBOutlet weak var optionOneButton: UIButton!
    
    @IBOutlet weak var completeButton: UIButton!
    
    
    var order: Order = .accuracy
    weak var delegate: OptionFilterViewDelegate?
    var getOrder: Order = .accuracy
    
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        
        order = getOrder
        
        switch order {
            case .accuracy:
                self.accuracyButton.filterSelected()
                self.recentButton.filterDeselected()
                self.lowPriceButton.filterDeselected()
                self.highPriceButton.filterDeselected()
                self.distanceButton.filterDeselected()
            case .recent:
                self.accuracyButton.filterDeselected()
                self.recentButton.filterSelected()
                self.lowPriceButton.filterDeselected()
                self.highPriceButton.filterDeselected()
                self.distanceButton.filterDeselected()
            case .lowPrice:
                self.accuracyButton.filterDeselected()
                self.recentButton.filterDeselected()
                self.lowPriceButton.filterSelected()
                self.highPriceButton.filterDeselected()
                self.distanceButton.filterDeselected()
            case .highPrice:
                self.accuracyButton.filterDeselected()
                self.recentButton.filterDeselected()
                self.lowPriceButton.filterDeselected()
                self.highPriceButton.filterSelected()
                self.distanceButton.filterDeselected()
        }
    }
    
//MARK: - private function
    private func configureView() {
        self.optionOneButton.layer.cornerRadius = 5
        self.optionTwoButton.layer.cornerRadius = 5
        self.optionThreeButton.layer.cornerRadius = 5
        
        self.optionTwoButton.layer.borderColor = UIColor(red: 228/255, green: 227/255, blue: 228/255, alpha: 1.0).cgColor
        self.optionTwoButton.layer.borderWidth = 1
        self.optionOneButton.layer.borderColor = UIColor(red: 228/255, green: 227/255, blue: 228/255, alpha: 1.0).cgColor
        self.optionOneButton.layer.borderWidth = 1
        
        self.completeButton.layer.cornerRadius = 8
    }
    
  
//MARK: - Action
    @IBAction func tapAccuracyButton(_ sender: UIButton) {
        order = .accuracy
        self.accuracyButton.filterSelected()
        self.recentButton.filterDeselected()
        self.lowPriceButton.filterDeselected()
        self.highPriceButton.filterDeselected()
        self.distanceButton.filterDeselected()
    }
    
    @IBAction func tapRecentButton(_ sender: UIButton) {
        order = .recent
        self.accuracyButton.filterDeselected()
        self.recentButton.filterSelected()
        self.lowPriceButton.filterDeselected()
        self.highPriceButton.filterDeselected()
        self.distanceButton.filterDeselected()
    }

    @IBAction func tapLowPriceButton(_ sender: UIButton) {
        order = .lowPrice
        self.accuracyButton.filterDeselected()
        self.recentButton.filterDeselected()
        self.lowPriceButton.filterSelected()
        self.highPriceButton.filterDeselected()
        self.distanceButton.filterDeselected()
    }
    
    @IBAction func tapHighPriceButton(_ sender: UIButton) {
        order = .highPrice
        self.accuracyButton.filterDeselected()
        self.recentButton.filterDeselected()
        self.lowPriceButton.filterDeselected()
        self.highPriceButton.filterSelected()
        self.distanceButton.filterDeselected()
    }
    
    @IBAction func tapDistanceButton(_ sender: UIButton) {
        self.accuracyButton.filterDeselected()
        self.recentButton.filterDeselected()
        self.lowPriceButton.filterDeselected()
        self.highPriceButton.filterDeselected()
        self.distanceButton.filterSelected()
    }
    
    
    @IBAction func tapOptionThree(_ sender: UIButton) {
        self.optionThreeButton.optionSelected()
        self.optionTwoButton.optionDeselected()
        self.optionOneButton.optionDeselected()
    }
    
    @IBAction func tapOptionTwo(_ sender: UIButton) {
        self.optionThreeButton.optionDeselected()
        self.optionTwoButton.optionSelected()
        self.optionOneButton.optionDeselected()
    }
    
    @IBAction func tapOptionOne(_ sender: UIButton) {
        self.optionThreeButton.optionDeselected()
        self.optionTwoButton.optionDeselected()
        self.optionOneButton.optionSelected()
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.delegate?.sendData(order)
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

//MARK: - Extension
extension OptionFilterViewController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }

    var shortFormHeight: PanModalHeight {
        return .contentHeight(700)
    }

    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(0)
    }
}
