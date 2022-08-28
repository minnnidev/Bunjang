//
//  TabSearchViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/28.
//

import UIKit
import Tabman
import Pageboy

class TabSearchViewController: TabmanViewController {
    @IBOutlet weak var tabBar: UIView!
    
    var viewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstVC = storyboard?.instantiateViewController(withIdentifier: "TabItemSearchViewController") as! TabItemSearchViewController
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "TabStoreSearchViewController") as! TabStoreSearchViewController
        
        //배열에 추가
        viewControllers.append(firstVC)
        viewControllers.append(secondVC)
        
    
        self.dataSource = self
        self.isScrollEnabled = false
        
        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.backgroundView.style = .blur(style: .regular)
        
        //button custom
        bar.buttons.customize { button in
            button.tintColor = .lightGray
            button.selectedTintColor = .black
        }
        
        
        
        //indicator custom
        bar.indicator.tintColor = .black
        bar.layout.interButtonSpacing = 30
    
        // Add to view
        addBar(bar, dataSource: self, at: .custom(view: tabBar, layout: nil))
  
    }
}

extension TabSearchViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return .at(index: 0)
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "상품")
        case 1:
            return TMBarItem(title: "상점")
        default:
            return TMBarItem(title: "오류")
        }
    }
    
}
