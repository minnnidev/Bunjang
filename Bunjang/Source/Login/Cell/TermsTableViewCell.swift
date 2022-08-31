//
//  TermsTableViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/31.
//

import UIKit

class TermsTableViewCell: UITableViewCell {
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var termLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.selectionStyle = .none

    }
    
}
