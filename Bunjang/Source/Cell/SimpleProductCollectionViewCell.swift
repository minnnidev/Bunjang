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
    
    @IBOutlet weak var stateCircleView: UIView!
    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var stateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //default
        self.imgView.layer.cornerRadius = 7
        
        //state
        self.stateCircleView.layer.borderColor = UIColor.white.cgColor
        self.stateCircleView.layer.borderWidth = 2
        self.stateCircleView.layer.cornerRadius = self.stateCircleView.frame.width/2
        self.stateView.layer.cornerRadius = 7
    }
    
    override func prepareForReuse() {
        self.stateView.isHidden = true
    }

}
