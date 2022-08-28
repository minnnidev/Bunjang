//
//  RecentSearchCollectionViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/28.
//

import UIKit

class RecentSearchCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var searchLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.layer.borderWidth = 1.5
        self.layer.cornerRadius = 5
    }

}
