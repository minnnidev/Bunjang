//
//  LabelPageIndicator.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/22.
//

import UIKit
import ImageSlideshow

extension LabelPageIndicator {
    
    public func setCustomLabel() {
        self.textColor = .white
        let systemFont = UIFont.systemFont(ofSize: 8, weight: .semibold)
        self.attributedText = NSAttributedString(string: self.text ?? "",
                                                 attributes: [NSAttributedString.Key.font : systemFont])
        //self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
}
