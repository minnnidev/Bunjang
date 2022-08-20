//
//  ProductCollectionViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/20.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imgView.layer.cornerRadius = 7
    }
}
