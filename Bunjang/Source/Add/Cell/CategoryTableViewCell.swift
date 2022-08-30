//
//  CategoryTableViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var chevronImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.selectionStyle = .none
    }
    
    override func prepareForReuse() {
        self.chevronImage.isHidden = false
    }
}
