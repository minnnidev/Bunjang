//
//  BrandFilterViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import UIKit
import PanModal

protocol BrandFilterViewDelegate: AnyObject {
    func sendBrandFilter(_ brandFilter: BrandFilter)
}

class BrandFilterViewController: UIViewController {
    var brandFilterCheck: BrandFilter = .KoreanFilter
    weak var delegate: BrandFilterViewDelegate?
    @IBOutlet weak var koreanFilterButton: UIButton!
    @IBOutlet weak var englishFilterButton: UIButton!
    
    
    
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if brandFilterCheck == .KoreanFilter {
            koreanFilterButton.filterSelected()
            englishFilterButton.filterDeselected()
        } else {
            koreanFilterButton.filterDeselected()
            englishFilterButton.filterSelected()
        }
    }
    
    
    
//MARK: - Action
    @IBAction func tapKoreanFilterButton(_ sender: UIButton) {
        self.delegate?.sendBrandFilter(.KoreanFilter)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tapEnglishFilterButton(_ sender: UIButton) {
        self.delegate?.sendBrandFilter(.EnglishFilter)
        self.dismiss(animated: true, completion: nil)
    }
}



//MARK: - Extension
extension BrandFilterViewController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }

    var shortFormHeight: PanModalHeight {
        return .contentHeight(130)
    }

    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(0)
    }
}
