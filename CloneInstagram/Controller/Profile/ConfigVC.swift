//
//  ConfigVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/10.
//

import UIKit

class ConfigVC: UIViewController {
	@IBOutlet weak var searchBar: UISearchBar!
	
	@IBOutlet weak var configTableView: UITableView!
	
	var tableTitle: [String] = ["친구 팔로우 및 초대", "알림", "개인정보 보호", "관리 감독", "보안", "광고", "계정", "도움말", "정보"]
	
	override func viewDidLoad() {
        super.viewDidLoad()

		setupTableView(viewName: configTableView, cell: "ConfigFirstCell", identifier: "configFirstCell")
		setupTableView(viewName: configTableView, cell: "ConfigSecondCell", identifier: "configSecondCell")
		setupTableView(viewName: configTableView, cell: "ConfigThirdCell", identifier: "configThirdCell")
        
    }
	
	func setupTableView(viewName: UITableView, cell: String, identifier: String) {
		
		let nib = UINib(nibName: cell, bundle: nil)
		viewName.register(nib, forCellReuseIdentifier: identifier)
		
		viewName.delegate = self
		viewName.dataSource = self
	}
	
	@IBAction func backBtnAction(_ sender: UIButton) {
		self.dismiss(animated: true)
	}
	

}

extension ConfigVC: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return self.tableTitle.count
		} else {
			return 1
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		switch indexPath.section {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "configFirstCell", for: indexPath) as! ConfigFirstCell
			
			cell.cellImg.image = UIImage(named: self.tableTitle[indexPath.row])
			cell.cellLbl.text = self.tableTitle[indexPath.row]
			return cell
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: "configSecondCell", for: indexPath) as! ConfigSecondCell
			
			return cell
		case 2:
			let cell = tableView.dequeueReusableCell(withIdentifier: "configThirdCell", for: indexPath) as! ConfigThirdCell
			
			return cell
		default:
			return UITableViewCell()
		}
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		if indexPath.section == 0 {
			return 70
			
		} else {
			return 180
		}
	}
}
