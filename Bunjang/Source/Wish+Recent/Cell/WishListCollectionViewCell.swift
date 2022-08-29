//
//  WishListCollectionViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/29.
//

import UIKit

class WishListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.itemImageView.layer.cornerRadius = 5
        self.storeImageView.layer.cornerRadius = self.storeImageView.frame.width/2
    }

}
