//
//  UITextField.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/21.
//

import UIKit

extension UITextField {
    func setRegisterTextField(text: String) {
        self.borderStyle = .none
        self.font = .systemFont(ofSize: 15, weight: .bold)
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        self.tintColor = .black
    }
}
