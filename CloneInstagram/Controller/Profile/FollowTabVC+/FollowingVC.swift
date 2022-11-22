//
//  FollowingVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/09.
//

import UIKit
import Kingfisher

class FollowingVC: UIViewController {

	@IBOutlet weak var searchBar: UISearchBar!
	
	@IBOutlet weak var followingTableView: UITableView!
	
	var count: Int = 1
	var followingResult: [FollowingResult]?
	
	var followingDataManager: FollowingDataManager = FollowingDataManager()
	
	override func viewWillAppear(_ animated: Bool) {
		followingDataManager.getHomeData(delegate: self)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		followingTableView.delegate = self
		followingTableView.dataSource = self
		followingTableView.register(UINib(nibName: "FollowingCell", bundle: nil), forCellReuseIdentifier: "followingCell")
        // Do any additional setup after loading the view.
    }
}


extension FollowingVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "followingCell", for: indexPath) as! FollowingCell
		
		guard let result = self.followingResult else { return cell }
		let res = result[indexPath.row]
		
		cell.uniqueNameLbl.text = res.uniqueName
		cell.nameLbl.text = res.name
		
		//image
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

extension FollowingVC {
	
	func didGetFollowing(result: [FollowingResult]) {
		
		self.count = result.count
		self.followingResult = result
		
		self.followingTableView.reloadData()
	}
}
