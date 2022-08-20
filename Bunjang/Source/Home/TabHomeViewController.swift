//
//  TabHomeViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/20.
//

import UIKit
import Tabman
import Pageboy

class TabHomeViewController: TabmanViewController {
    @IBOutlet weak var tabBarView: UIView! //height 조정하기 위해 view 만들어 줌
    
    var viewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let firstVC = storyboard?.instantiateViewController(withIdentifier: "TabFirstViewController") as! TabFirstViewController
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "TabSecondViewController") as! TabSecondViewController
        
        //배열에 추가
        viewControllers.append(firstVC)
        viewControllers.append(secondVC)

        
        self.dataSource = self
        
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
    
        // Add to view
        addBar(bar, dataSource: self, at: .custom(view: tabBarView, layout: nil))
       
    }
}

extension TabHomeViewController: PageboyViewControllerDataSource, TMBarDataSource {
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
            return TMBarItem(title: "추천상품")
        case 1:
            return TMBarItem(title: "브랜드")
        default:
            return TMBarItem(title: "오류")
        }
    }
    
}
