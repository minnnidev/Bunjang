//
//  d.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/25.
//

import Foundation
import UIKit

class SelfSizingCollectionView: UICollectionView {

    override var contentSize: CGSize{
        didSet {
            if oldValue.height != self.contentSize.height {
                invalidateIntrinsicContentSize()
            }
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric,
                      height: contentSize.height)
    }
}
