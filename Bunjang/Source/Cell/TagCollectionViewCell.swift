//
//  TagCollectionViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/24.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.layer.borderColor = UIColor(red: 246/255, green: 245/255, blue: 245/255, alpha: 1.0).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }

}
