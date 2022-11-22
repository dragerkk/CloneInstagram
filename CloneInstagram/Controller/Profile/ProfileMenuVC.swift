//
//  ProfileMenuVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/03.
//

import UIKit

class ProfileMenuVC: UIViewController {

	@IBOutlet weak var menuTableView: UITableView!
	
	var cellImg: [String] = ["설정", "내 활동", "보관", "QR 코드", "저장됨", "디지털 자산", "친한 친구", "즐겨찾기", "코로나19 정보 센터"]
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.menuTableView.register(UINib(nibName: "ProfileMenuCell", bundle: nil), forCellReuseIdentifier: "profileMenuCell")
		self.menuTableView.delegate = self
		self.menuTableView.dataSource = self
		self.view.layer.cornerRadius = 15
    }

}

// MARK: - tableview settings
extension ProfileMenuVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cellImg.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "profileMenuCell", for: indexPath) as! ProfileMenuCell
		cell.cellImg.image = UIImage(named: self.cellImg[indexPath.row])
		cell.cellLbl.text = cellImg[indexPath.row]
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 70
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath.row == 0 {
			let vc = ConfigVC(nibName: "ConfigVC", bundle: nil)
			vc.modalPresentationStyle = .fullScreen
			self.present(vc, animated: true)
		}
	}
}
