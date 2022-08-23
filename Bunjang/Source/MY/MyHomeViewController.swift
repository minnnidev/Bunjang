//
//  MyHomeViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/23.
//

import UIKit
import Pageboy
import Tabman

class MyHomeViewController: TabmanViewController {
    @IBOutlet weak var tabView: UIView!
    var viewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = storyboard?.instantiateViewController(withIdentifier: "SellingViewController") as! SellingViewController
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "ReservedViewController") as! ReservedViewController
        let thirdVC = storyboard?.instantiateViewController(withIdentifier: "SoldViewController") as! SoldViewController
        
        //배열에 추가
        viewControllers.append(firstVC)
        viewControllers.append(secondVC)
        viewControllers.append(thirdVC)
        
        self.dataSource = self
        
        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.backgroundView.style = .blur(style: .regular)

        //button custom
        bar.buttons.customize { button in
            button.tintColor = .lightGray
            button.selectedTintColor = .black
            button.font = .systemFont(ofSize: 14)
        }

        //indicator custom
        bar.indicator.tintColor = .black
        bar.indicator.weight = .light
         
        // Add to view
        addBar(bar, dataSource: self, at: .custom(view: self.tabView, layout: nil))
    }
}

extension MyHomeViewController: PageboyViewControllerDataSource, TMBarDataSource  {
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
            return TMBarItem(title: "판매중")
        case 1:
            return TMBarItem(title: "예약중")
        case 2:
            return TMBarItem(title: "판매완료")
        default:
            return TMBarItem(title: "오류")
        }
    }
}

