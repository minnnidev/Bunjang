//
//  RecentCollectionViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import UIKit

class RecentCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.itemImageView.layer.cornerRadius = 8
    }

}
