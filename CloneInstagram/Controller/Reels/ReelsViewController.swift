//
//  ReelsViewController.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/11.
//

import UIKit
import Kingfisher

class ReelsViewController: UIViewController {

	@IBOutlet weak var reelsCollectionView: UICollectionView!
	
	var dummyImg: [String] = ["우주1", "우주2", "우주3"]
	
	var result: [ReelsResult]?
	var dataManager: ReelsDataManager = ReelsDataManager()
	var reelsCount: Int = 1
	
	override func viewWillAppear(_ animated: Bool) {
		self.dataManager.getReelsData(delegate: self)
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

		reelsCollectionView.delegate = self
		reelsCollectionView.dataSource = self
		reelsCollectionView.register(UINib(nibName: "ReelsCell", bundle: nil), forCellWithReuseIdentifier: "reelsCell")
		
    }
	
    

}

extension ReelsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return reelsCount
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reelsCell", for: indexPath) as! ReelsCell
		
		// 제목 처리
		if indexPath.row == 0 {
			cell.titleLbl.text = "릴스"
		} else {
			cell.titleLbl.text = ""
		}
		
		guard let result = self.result else { return cell }
		let res = result[indexPath.row]
		
		//배경이미지 (더미)
		cell.bgImg.image = UIImage(named: self.dummyImg[indexPath.row])
		
		//좋아요, 채팅 수
		cell.likeLbl.text = String((res.reelsLikeCount) ?? 0)
		cell.chatLbl.text = String((res.comments?.count) ?? 0)
		
		//프로필이미지
		let imgUrl = res.profileImg
		if imgUrl == "" {
			cell.profileImg.image = UIImage(named: "emptyProfile")
			cell.sqProfileImg.image = UIImage(named: "emptyProfile")
		} else {
			let decUrl = imgUrl.decodeUrl()!
			let encUrl = decUrl.encodeUrl()!
		
			cell.profileImg.kf.setImage(with: URL(string: encUrl))
			cell.sqProfileImg.kf.setImage(with: URL(string: encUrl))
		}
		
		//이름
		cell.nameLbl.text = " " + res.uniqueName
		cell.nameBtn.setTitle(" " + res.uniqueName, for: .normal)
		
		//음악
//		cell.musicBtn
		
		//컨텐츠
		cell.contentLbl.text = res.content
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: self.view.frame.width, height: self.reelsCollectionView.frame.height)
	}
}

// MARK: - api
extension ReelsViewController {
	
	func didGetReelsData(result: [ReelsResult]) {
		self.result = result
		self.reelsCount = result.count
		print("get reels data success.")
		reelsCollectionView.reloadData()
	}
}
