//
//  StoreInquiryTableViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/28.
//

import UIKit

class StoreInquiryTableViewCell: UITableViewCell {
    @IBOutlet weak var inquiryImageView: UIImageView!
    @IBOutlet weak var inquiryNameLabel: UILabel!
    @IBOutlet weak var inquiryDateLabel: UILabel!
    @IBOutlet weak var inquiryContentView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.inquiryImageView.layer.cornerRadius = self.inquiryImageView.frame.width/2
        self.inquiryImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.selectionStyle = .none
    }
    
}
