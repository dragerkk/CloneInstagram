//
//  LoginTabVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/10/30.
//

import UIKit
import Tabman
import Pageboy

class LoginTabVC: TabmanViewController {
	
	@IBOutlet var tabView: UIView!
	
	private var viewControllers: [UIViewController] = []
	private  var tabbarTitle: [String] = ["전화번호", "이메일"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupTabBar()
		self.navigationController?.isToolbarHidden = true
	}
	
}

// MARK: - tabbar customize
extension LoginTabVC {
	
	func setupTabBar() {
		
		let phoneVC = PhoneVC(nibName: "PhoneVC", bundle: nil)
		viewControllers.append(phoneVC)
		
		let emailVC = EmailVC(nibName: "EmailVC", bundle: nibBundle)
		viewControllers.append(emailVC)
		
		self.dataSource = self
		
		let bar = TMBar.ButtonBar()
		bar.backgroundView.style = .blur(style: .light)
		bar.layout.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
		bar.buttons.customize { (button) in
			button.tintColor = .systemGray
			button.selectedTintColor = .black
			button.font = .systemFont(ofSize: 22, weight: .semibold)
			button.selectedFont = .systemFont(ofSize: 22, weight: .semibold)
		}
		
		bar.indicator.weight = .custom(value: 2)
		bar.indicator.tintColor = .black
		
		bar.layout.transitionStyle = .snap
		addBar(bar, dataSource: self, at: .top)
		
	}
	
}

// MARK: - datasource
extension LoginTabVC: PageboyViewControllerDataSource, TMBarDataSource {
	
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
		let item = TMBarItem(title: tabbarTitle[index])
		return item
	}
}
