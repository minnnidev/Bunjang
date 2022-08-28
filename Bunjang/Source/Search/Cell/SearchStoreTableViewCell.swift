//
//  SearchStoreTableViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/28.
//

import UIKit

class SearchStoreTableViewCell: UITableViewCell {
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.storeImageView.layer.cornerRadius = self.storeImageView.frame.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
