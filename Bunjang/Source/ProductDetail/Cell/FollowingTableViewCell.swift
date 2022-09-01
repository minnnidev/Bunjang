//
//  FollowingTableViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/09/01.
//

import UIKit

class FollowingTableViewCell: UITableViewCell {
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var itemsCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.storeImageView.layer.cornerRadius = self.storeImageView.frame.width/2
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.selectionStyle = .none
    }
    
}
