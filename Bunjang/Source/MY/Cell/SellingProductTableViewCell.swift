//
//  SellingProductTableViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/23.
//

import UIKit

class SellingProductTableViewCell: UITableViewCell {
    @IBOutlet weak var sellFastButton: UIButton!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.sellFastButton.layer.borderWidth = 1
        self.sellFastButton.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.selectionStyle = .none
    }
    
}
