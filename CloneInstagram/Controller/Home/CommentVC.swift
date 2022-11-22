//
//  CommentVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/10.
//

import UIKit
import Kingfisher

class CommentVC: UIViewController {

	@IBOutlet weak var commentField: UITextField!
	
	@IBOutlet weak var commentTableView: UITableView!
	
	@IBOutlet weak var profileImg: UIImageView!
	
	var dataManager: CommentDataManager = CommentDataManager()
	var result: [CommentResult]?
	var resultCount: Int = 0
	
	// content
	var postId: String = ""
	var name: String = ""
	var content: String = ""
	var time: String = ""
	var profileImgUrl: String = ""
	
	var commentImgUrl: String = ""
	
	
	override func viewWillAppear(_ animated: Bool) {
		self.dataManager.getComment(postId: self.postId, delegate: self)
	}
	override func viewDidLoad() {
        super.viewDidLoad()
		
		print("sended postId; \(self.postId)")

        // Do any additional setup after loading the view.
		commentField.layer.cornerRadius = 22
		commentField.layer.borderWidth = 0.5
		commentField.layer.borderColor = UIColor.lightGray.cgColor
		
		commentField.clipsToBounds = true
		
		commentTableView.delegate = self
		commentTableView.dataSource = self
		commentTableView.register(UINib(nibName: "CommentContentCell", bundle: nil), forCellReuseIdentifier: "commentContentCell")
		commentTableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "commentCell")
		
		self.profileImg.layer.cornerRadius = self.profileImg.frame.width / 2
		
		print(postId)
    }


	@IBAction func backBtnAction(_ sender: UIButton) {
		self.dismiss(animated: true)
	}
	
}


extension CommentVC: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	
		switch section {
		case 0:
			return 1
		case 1:
			return self.resultCount
//			return 10
		default:
			return 1
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		switch indexPath.section {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "commentContentCell", for: indexPath) as! CommentContentCell
			
			tableView.rowHeight = UITableView.automaticDimension
		
			//label
			let userName = self.name
			let postContent = self.content
			let str = userName + " " + postContent
			cell.cellLbl.text = str
			cell.cellLbl.bold(targetString: userName)

			//img
			if self.profileImgUrl != "" {
				let decUrl = self.profileImgUrl.decodeUrl()!
				let encUrl = decUrl.encodeUrl()!
				cell.cellImg.kf.setImage(with: URL(string: encUrl))
			} else {
				cell.cellImg.image = UIImage(named: "emptyProfile")
			}
			
			//time
			cell.timeLbl.text = self.time
			
			return cell
			
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentCell
			
			tableView.rowHeight = UITableView.automaticDimension
			
			guard let result = self.result else { return cell }
			let res = result[indexPath.row]
			
			//label
			let userName = res.comment.name ?? "test"
			let postContent = res.comment.content ?? " "
			let str = userName + " " + postContent
			cell.cellLbl.text = str
			cell.cellLbl.bold(targetString: userName)
			
			//image
			
			if res.comment.profileImg != "" {
				let decUrl = res.comment.profileImg!.decodeUrl()!
				let encUrl = decUrl.encodeUrl()!
				cell.cellimg.kf.setImage(with: URL(string: encUrl))
			} else {
				cell.cellimg.image = UIImage(named: "emptyProfile")
			}
			
			//time
			cell.timeLbl.text = res.comment.timeDiff ?? "지금"
			//like
			let likeCnt = res.comment.likeCount ?? 0
			
			cell.likeLbl.text = "좋아요 " + String(likeCnt) + "개"
			
			
			return cell
			
		default:
			return UITableViewCell()
		}
	}
	
	
}

// MARK: - api
extension CommentVC {
	
	func didGetCommentData(result: [CommentResult]) {
		
		self.result = result
		self.resultCount = result.count
		print("comment data api connected.")
		print("result: \(self.result)")
		print("count: \(self.resultCount)")
		self.commentTableView.reloadData()
	}
}
