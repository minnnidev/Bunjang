//
//  SimpleBrandTableViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import UIKit

enum Follow {
    case followed
    case notFollowed
}

class SimpleBrandTableViewCell: UITableViewCell {
    @IBOutlet weak var brandImageView: UIImageView!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var brandEnglishNameLabel: UILabel!
    @IBOutlet weak var brandItemCountLabel: UILabel!
    @IBOutlet weak var brandFollowButton: UIButton!
    
    var checkFollow: Follow = .notFollowed
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.brandImageView.layer.cornerRadius = self.brandImageView.frame.width/2
        self.brandImageView.layer.borderColor = UIColor.borderGrayColor.cgColor
        self.brandImageView.layer.borderWidth = 0.5
        self.brandFollowButton.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.selectionStyle = .none
    }
    
    override func prepareForReuse() {
        
    }
    
    @IBAction func tapFollowButton(_ sender: UIButton) {
        if checkFollow == .notFollowed {
            self.brandFollowButton.followed()
            self.checkFollow = .followed
        } else {
            self.brandFollowButton.notFollow()
            self.checkFollow = .notFollowed
        }
    }
    
    
}
