//
//  StoryTabViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 25/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class StoryTabViewController: TabmanViewController {
    
    private var viewControllers = [UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController(), UIViewController()]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        
        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        
        addBar(bar, dataSource: self, at: .top)
        
    }
}

extension StoryTabViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        switch index {
        case 0:
            return TMBarItem(title: "전체")
        case 1:
            return TMBarItem(title: "인턴")
        case 2:
            return TMBarItem(title: "대외활동")
        case 3:
            return TMBarItem(title: "공모전")
        case 4:
            return TMBarItem(title: "동아리")
        case 5:
            return TMBarItem(title: "자격증")
        case 6:
            return TMBarItem(title: "기타")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
        
    }
    
}

