//
//  StoreReviewTableViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/28.
//

import UIKit

class StoreReviewTableViewCell: UITableViewCell {
    @IBOutlet weak var reviewImageView: UIImageView!
    @IBOutlet weak var reviewerNameLabel: UILabel!
    @IBOutlet weak var reviewContentView: UILabel!
    @IBOutlet weak var reviewDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.reviewImageView.layer.cornerRadius = self.reviewImageView.frame.width/2
        self.reviewImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.selectionStyle = .none
    }
    
}
