//
//  UIViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/30.
//

import Foundation
import UIKit

extension UIViewController {
    func showIndicator() {
        IndicatorView.shared.show()
        IndicatorView.shared.showIndicator()
    }
    
    @objc func dismissIndicator() {
        IndicatorView.shared.dismiss()
    }
}
