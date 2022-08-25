//
//  ReviewCollectionViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/25.
//

import UIKit

class ReviewCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var starRateLabel: UILabel!
    @IBOutlet weak var reviewContentLabel: UILabel!
    @IBOutlet weak var reviewerNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
