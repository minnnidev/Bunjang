//
//  BrandTableViewCell.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/21.
//

import UIKit

class BrandTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setCollectionView()
    }
    
    private func setCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "SimpleProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SimpleProductCollectionViewCell")
        
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: 120, height: 200)
        flowlayout.scrollDirection = .horizontal
        self.collectionView.collectionViewLayout = flowlayout
        
        self.imgView.layer.cornerRadius = self.imgView.frame.width/2
        self.followButton.layer.cornerRadius = 7
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        selectionStyle = .none
    }
}

extension BrandTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "SimpleProductCollectionViewCell", for: indexPath) as? SimpleProductCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
}
