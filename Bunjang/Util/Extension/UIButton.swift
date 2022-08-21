//
//  UIButton.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/21.
//

import UIKit

extension UIButton {
    //버튼 밑줄
    func setUnderline() {
        guard let title = title(for: .normal) else {return}
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: title.count))
        setAttributedTitle(attributedString, for: .normal)
    }
}
