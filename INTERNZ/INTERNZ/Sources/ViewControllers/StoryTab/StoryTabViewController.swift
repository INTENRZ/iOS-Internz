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
    
    private var viewControllers: [UIViewController] = [] {
        didSet {
            setupTabmanDatasource()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
        
        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        
        // Customize button color
        bar.buttons.customize { (button) in
            button.tintColor = UIColor.brownishGreyTwo
            button.selectedTintColor = UIColor.marigold
        }
        
        bar.indicator.tintColor = UIColor.marigold
        
        addBar(bar, dataSource: self, at: .top)
        
    }
}

extension StoryTabViewController {
    func setupViewControllers() {
        let storyVC1 = UIStoryboard(name: "Story", bundle: nil).instantiateViewController(identifier: "Story") as! StoryViewController
        
        let storyVC2 = UIStoryboard(name: "Story", bundle: nil).instantiateViewController(identifier: "Story") as! StoryViewController
        
        let storyVC3 = UIStoryboard(name: "Story", bundle: nil).instantiateViewController(identifier: "Story") as! StoryViewController
        
        let storyVC4 = UIStoryboard(name: "Story", bundle: nil).instantiateViewController(identifier: "Story") as! StoryViewController
        
        let storyVC5 = UIStoryboard(name: "Story", bundle: nil).instantiateViewController(identifier: "Story") as! StoryViewController
        
        let storyVC6 = UIStoryboard(name: "Story", bundle: nil).instantiateViewController(identifier: "Story") as! StoryViewController
        
        let storyVC7 = UIStoryboard(name: "Story", bundle: nil).instantiateViewController(identifier: "Story") as! StoryViewController
        self.viewControllers = [storyVC1, storyVC2, storyVC3, storyVC4, storyVC5, storyVC6, storyVC7]
    }
    
    func setupTabmanDatasource() {
        self.dataSource = self
        self.reloadData()
    }
}

extension StoryTabViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        print(viewControllers.count)
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
            return TMBarItem(title: "  전체")
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
            return TMBarItem(title: "기타  ")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
        
    }
    
}

