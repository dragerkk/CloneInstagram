//
//  FollowerVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/09.
//

import UIKit
import Kingfisher

class FollowerVC: UIViewController {

	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var followTableView: UITableView!
	
	var followerCount: Int = 1
	var followerResult: [FollowerResult]?
	
	var followerDataManager: FollowerDataManager = FollowerDataManager()
	
	override func viewWillAppear(_ animated: Bool) {
		followerDataManager.getFollowerData(delegate: self)
	}
	override func viewDidLoad() {
        super.viewDidLoad()

		followTableView.delegate = self
		followTableView.dataSource = self
		followTableView.register(UINib(nibName: "FollowerCell", bundle: nil), forCellReuseIdentifier: "followerCell")
        // Do any additional setup after loading the view.
		
		searchBar.layer.borderWidth = 0
    }

}

// MARK: - tableview
extension FollowerVC: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
//		return 10
		return self.followerCount
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "followerCell", for: indexPath) as! FollowerCell
		
		guard let result = self.followerResult else { return cell }
		let res = result[indexPath.row]
		cell.uniqueNameLbl.text = res.uniqueName
		cell.nameLbl.text = res.name
		
		//image
		if res.imgUrl == "" {
			cell.profileImg.image = UIImage(named: "emptyProfile")
		} else if res.imgUrl != "" {
			guard let url = res.imgUrl else { return cell }
			let decodedUrl = url.decodeUrl()!
			let encodedUrl = decodedUrl.encodeUrl()!
			
			cell.profileImg.kf.setImage(with: URL(string: encodedUrl))
		}
		
		return cell
	}
}


// MARK: - api
extension FollowerVC {
	
	func didGetFollower(result: [FollowerResult]) {
//		self.followerName = result.name
//		self.followerUniqueName = result.uniqueName
//
//		guard let url = result.imgUrl else { return }
//		self.profileUrl = url
		self.followerCount = result.count
		self.followerResult = result
//		print(followerResult)
		self.followTableView.reloadData()
	}
}
