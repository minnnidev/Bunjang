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
    @IBOutlet weak var heartView: UIView!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var wishNumberLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var isHeart = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imgView.layer.cornerRadius = 7
    }
    
    @IBAction func tapHeartButton(_ sender: UIButton) {
        if isHeart {
            //찜 취소
            isHeart = false
            self.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            self.heartButton.tintColor = .white
        } else {
            //찜으로 추가
            isHeart = true
            self.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            self.heartButton.tintColor = .red
        }
    }
    
}
