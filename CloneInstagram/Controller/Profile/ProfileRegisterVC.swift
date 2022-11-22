//
//  ProfileRegisterVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/02.
//

import UIKit

class ProfileRegisterVC: UIViewController {
	
	
	
	@IBOutlet weak var tableView: UITableView!
	
	var cellImg: [String] = ["릴스", "게시물", "스토리", "스토리 하이라이트", "라이브 방송"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		self.tableView.estimatedRowHeight = 100
		
		
		let nib = UINib(nibName: "ProfileRegisterCell", bundle: nil)
		self.tableView.register(nib, forCellReuseIdentifier: "profileRegisterCell")
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		self.view.layer.cornerRadius = 15
	}
	
}

extension ProfileRegisterVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = self.tableView.dequeueReusableCell(withIdentifier: "profileRegisterCell", for: indexPath) as! ProfileRegisterCell
		
		cell.cellImg.image = UIImage(named: self.cellImg[indexPath.row])
		cell.cellLbl.text = cellImg[indexPath.row]
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 70
	}
	
}
