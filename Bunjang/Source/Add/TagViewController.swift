//
//  TagViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/27.
//

import UIKit

protocol TagViewDelegate: AnyObject {
    func sendTags(_ tags: [String])
}

class TagViewController: UIViewController {
    @IBOutlet weak var tagTextField: UITextField!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    
    var tags: [String] = []
    weak var delegate: TagViewDelegate?
    
//MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tagCollectionView.delegate = self
        self.tagCollectionView.dataSource = self
        self.tagCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0)
        
        self.tagCollectionView.register(UINib(nibName: "AddTagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AddTagCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.tagCollectionView.collectionViewLayout = flowLayout
    }
    
    
//MARK: - Action
    @IBAction func tapAddTagButton(_ sender: UIButton) {
        guard let tag = self.tagTextField.text else {return}
        self.tags.append(tag)
        
        self.tagTextField.text = ""
        
        DispatchQueue.main.async {
            self.tagCollectionView.reloadData()
        }
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.delegate?.sendTags(self.tags)
        self.navigationController?.popViewController(animated: true)
    }
}

extension TagViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.tagCollectionView.dequeueReusableCell(withReuseIdentifier: "AddTagCollectionViewCell", for: indexPath) as? AddTagCollectionViewCell else {return UICollectionViewCell()}
        
        cell.tagLabel.text = self.tags[indexPath.row]
        
        return cell
    }
}

//MARK: - Extension: UICollectionViewDelegateFlowLayout
extension TagViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let label = UILabel(frame: CGRect.zero)
        label.text = self.tags[indexPath.item]
        label.sizeToFit()
    
        
        let cellWidth = label.frame.width + 40
        
        return CGSize(width: cellWidth, height: 30)
    }
}
