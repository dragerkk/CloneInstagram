//
//  ProfileTabVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/02.
//

import UIKit
import Tabman
import Pageboy

class ProfileTabVC: TabmanViewController {

	@IBOutlet var tabView: UIView!
	
	private var viewControllers: [UIViewController] = []
	private var tabbarTitle: [UIImage] =
//	[UIImage(systemName: "sun.min")!, UIImage(systemName: "cloud.fill")!]
	[UIImage(named: "contentImg")!, UIImage(named: "taggedImg")!]
	
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
    
}

// MARK: - tabbar customize
extension ProfileTabVC {
	
	func setupTabBar() {
		
		let myContentVC = MyContentVC(nibName: "MyContentVC", bundle: nil)
		self.viewControllers.append(myContentVC)
		
		let taggedVC = TaggedVC(nibName: "TaggedVC", bundle: nil)
		self.viewControllers.append(taggedVC)
		
		self.dataSource = self
		
//		let bar = TMBar.ButtonBar()
		let bar = TMBar.TabBar()
		bar.backgroundView.style = .blur(style: .light)
		bar.layout.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
		
		bar.buttons.customize { (button) in
			button.tintColor = .systemGray
			button.selectedTintColor = .black
			button.font = .systemFont(ofSize: 22, weight: .semibold)
//			button.selectedFont = .systemFont(ofSize: 22, weight: .semibold)
		}
		
//		bar.indicator.weight = .custom(value: 2)
		bar.indicator.tintColor = .black
		
		bar.layout.transitionStyle = .snap
		addBar(bar, dataSource: self, at: .top)
		
	}
}

// MARK: - datasource
extension ProfileTabVC: PageboyViewControllerDataSource, TMBarDataSource {
	
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
		let item = TMBarItem(image: tabbarTitle[index])
		
		return item
	}
}
