//
//  SimpleProductCollectionViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/21.
//

import UIKit

class SimpleProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var bungaePayImage: UIImageView!
    @IBOutlet weak var ADImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.imgView.layer.cornerRadius = 7
    }

}
