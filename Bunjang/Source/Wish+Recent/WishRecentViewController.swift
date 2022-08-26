//
//  WishRecentViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/26.
//

import UIKit
import Tabman
import Pageboy

class WishRecentViewController: TabmanViewController {
    var viewControllers: [UIViewController] = []
    var index: Int?

//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let firstVC = storyboard?.instantiateViewController(withIdentifier: "WishViewController") as! WishViewController
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "RecentViewController") as! RecentViewController
        
        //배열에 추가
        viewControllers.append(firstVC)
        viewControllers.append(secondVC)
        
        
        self.dataSource = self
        
        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.layout.contentMode = .fit
        bar.backgroundView.style = .blur(style: .regular)
        
        //button custom
        bar.buttons.customize { button in
            button.tintColor = .lightGray
            button.selectedTintColor = .black
        }
        
        //indicator custom
        bar.indicator.tintColor = .black
        bar.indicator.weight = .light
    
        // Add to view
        addBar(bar, dataSource: self, at: .top)
    }
    

}

//MARK: - Extension
extension WishRecentViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        if let index = self.index {
            return .at(index: index)
        }
        return .at(index: 0)
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "찜")
        case 1:
            return TMBarItem(title: "최근 본 상품")
        default:
            return TMBarItem(title: "오류")
        }
    }
    
}
