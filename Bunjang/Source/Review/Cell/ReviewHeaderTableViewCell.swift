//
//  ReviewHeaderTableViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/29.
//

import UIKit

class ReviewHeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var reviewButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.reviewButton.layer.borderWidth = 1
        self.reviewButton.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
