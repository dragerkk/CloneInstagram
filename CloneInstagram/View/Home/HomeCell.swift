//
//  HomeCell.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/10/30.
//

import UIKit
import Kingfisher

// delegate
protocol HomeCellDelegate: AnyObject {
	func commentBtnAction()
}

class HomeCell: UICollectionViewCell {
	
	@IBOutlet weak var profileImg: UIImageView!
	@IBOutlet weak var nameLbl: UILabel!
	@IBOutlet weak var locationLbl: UILabel!
	
	@IBOutlet weak var homeCellCollectionView: UICollectionView!
	
	@IBOutlet weak var likeLbl: UILabel!
	@IBOutlet weak var contentLbl: UILabel!
	
	@IBOutlet weak var replyLbl: UILabel!
	
	@IBOutlet weak var likeBtn: UIButton!
	
	@IBOutlet weak var commentBtn: UIButton!
	
	// delegate
	weak var delegate: HomeCellDelegate?
	
	var imageCount: Int = 0
	var imageUrls: [String]?
	
	var isLike: Bool = false
	var postId: Int = 1
	
	var likeCount: Int = 0
	
	
	var likeDataManager: LikeDataManager = LikeDataManager()
	
	var dislikeDataManager: DisLikeDataManager = DisLikeDataManager()
	
	//	var dislikeDataManager
	
	var sendPostId: String = ""
	var name: String = ""
	var content: String = ""
	var time: String = ""
	var profileImgUrl: String = ""
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		let nib = UINib(nibName: "HomeImageCell", bundle: nil)
		self.homeCellCollectionView.register(nib, forCellWithReuseIdentifier: "homeImageCell")
		self.homeCellCollectionView.delegate = self
		self.homeCellCollectionView.dataSource = self
		
		self.layer.borderWidth = 0.3
		self.layer.borderColor = UIColor.lightGray.cgColor
		//		print("homeCell data sended: \(imageUrls)")
		print("AWAKE")
		//		homeCellCollectionView.reloadData()
		// 프로필 이미지 둥글게 처리 & 테두리
		profileImg.layer.cornerRadius = profileImg.frame.height/2
		profileImg.clipsToBounds = true
		profileImg.layer.borderColor = UIColor.lightGray.cgColor
		profileImg.layer.borderWidth = 0.2
	}
	
	
	//delegate
	@IBAction func commentBtnAction() {
		
		delegate?.commentBtnAction()
	}
	
	func reloadCell() {
		self.homeCellCollectionView.reloadData()
	}
	
	@IBAction func dotBtnAction(_ sender: UIButton) {
	}
	
	@IBAction func likeBtnAction(_ sender: UIButton) {
		sender.isSelected = !sender.isSelected
		
		if sender.isSelected {
			sender.setImage(UIImage(named: "like.fill"), for: .normal)
			self.isLike = true
			print("postId: \(postId)")
			self.likeDataManager.PostLike(postId: String(self.postId), delegate: self)
			self.likeCount += 1
			self.likeLbl.text = "좋아요 \(self.likeCount)개"
			
		} else {
			sender.setImage(UIImage(named: "like"), for: .normal)
			self.isLike = false
			self.likeCount -= 1
			self.likeLbl.text = "좋아요 \(self.likeCount)개"
			self.dislikeDataManager.PostDisLike(postId: String(self.postId), delegate: self)
		}
		
		print("isLike: \(self.isLike)")
	}
	
	
	@IBAction func bookmarkBtnAction(_ sender: UIButton) {
	}
	
	
}

extension HomeCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return imageCount
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeImageCell", for: indexPath) as! HomeImageCell
		
		//		print("homecell ddddd")
		
		guard let img = self.imageUrls else { return cell }
		
		let decodedUrl = img[indexPath.row].decodeUrl()!
		let encodedUrl = decodedUrl.encodeUrl()!
		//		print("imgUrl: \(encodedUrl)")
		//		cell.homeImg.kf.setImage(with: URL(string: img[indexPath.row]))
		cell.homeImg.kf.setImage(with: URL(string: encodedUrl))
		//		homeCellCollectionView.reloadData()
		//test
		//		cell.homeImg.kf.setImage(with: URL(string: "https://instagram-s3-bucket.s3.ap-northeast-2.amazonaws.com/posts/a1dfdeaa-fc29-44f7-a10f-6c973e3475261-2.JPG"))
		return cell
	}
	//
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: self.frame.width, height: collectionView.frame.height)
	}
}
