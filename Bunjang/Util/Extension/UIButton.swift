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
    
    func setButtonState(selectImage: UIImage, selectColor: UIColor, deselectImage: UIImage) {
        if isSelected {
            self.setImage(selectImage, for: .normal)
            self.tintColor = selectColor
        } else {
            self.setImage(deselectImage, for: .normal)
        }
    }
    
    func optionSelected() {
        self.backgroundColor = UIColor(red: 255/255, green: 238/255, blue: 240/255, alpha: 1.0)
        self.setTitleColor(.red, for: .normal)
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.white.cgColor
    }
    
    func optionDeselected() {
        self.backgroundColor = .white
        self.setTitleColor(.lightGray, for: .normal)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 228/255, green: 227/255, blue: 228/255, alpha: 1.0).cgColor
    }
    
    func filterSelected() {
        let color = UIColor(red: 215/255, green: 12/255, blue: 24/255, alpha: 1.0)
        self.setTitleColor(color, for: .normal)
    }
    
    func filterDeselected() {
        self.setTitleColor(.lightGray, for: .normal)
    }
}
