//
//  SimpleProductCollectionViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/21.
//

import UIKit

class SimpleProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.imgView.layer.cornerRadius = 7
    }

}
