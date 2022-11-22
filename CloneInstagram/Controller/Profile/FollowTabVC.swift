//
//  FollowTabVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/09.
//

import UIKit
import Tabman
import Pageboy

class FollowTabVC: TabmanViewController {

	@IBOutlet var tabView: UIView!
	
	private var viewControllers: [UIViewController] = []
	private var tabbarTitle: [String] = ["팔로워", "팔로잉"]
	
	var followerCount: Int = 0
	var followingCount: Int = 0
	
	var followDataManager: ProfileDataManager = ProfileDataManager()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		followDataManager.getFollowCount(delegate: self)
//		setupTabBar()
		self.navigationController?.isNavigationBarHidden = true
    }
    
}

extension FollowTabVC {
	
	func setupTabBar() {
		
		let followerVC = FollowerVC(nibName: "FollowerVC", bundle: nil)
		self.viewControllers.append(followerVC)
		
		let followingVC = FollowingVC(nibName: "FollowingVC", bundle: nil)
		self.viewControllers.append(followingVC)
		
		self.dataSource = self
		
		let bar = TMBar.ButtonBar()
		bar.backgroundView.style = .blur(style: .light)
		bar.layout.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

		bar.buttons.customize { button in
			button.tintColor = .systemGray
			button.selectedTintColor = .black
			button.font = .systemFont(ofSize: 17, weight: .semibold)
//			button.intrinsicContentSize = CGSize(width: self.view.frame.width / 2 - 10, height: 50)
		}
		
		bar.indicator.tintColor = .black
		bar.indicator.weight = .custom(value: 0.5)
		bar.layout.transitionStyle = .snap
		bar.layout.contentMode = .fit
		addBar(bar, dataSource: self, at: .top)
	}
}

// MARK: - datasource
extension FollowTabVC: PageboyViewControllerDataSource, TMBarDataSource {
	
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
		let title: String
		
		switch index {
		case 0:
			title = String(self.followerCount) + " 팔로워"
		case 1:
			title = String(self.followingCount) + " 팔로잉"
		default:
			title = self.tabbarTitle[index]
		}
//		let title = String(self.followerCount self.tabbarTitle[index]
		return TMBarItem(title: title)
	}
}


// MARK: - api 관련
extension FollowTabVC {
	
	func didGetFollowCount(result: ProfileResult) {
		self.followerCount = result.followerCount
		self.followingCount = result.followingCount
		setupTabBar()
	}
}
