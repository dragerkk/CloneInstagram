//
//  HomeStoryUpperCell.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/08.
//

import UIKit
import Kingfisher

class HomeStoryUpperCell: UICollectionViewCell {
	
	@IBOutlet weak var storyCollectionView: UICollectionView!
	
	var storyCount: Int = 0
//	var userName: String = ""
//	var userProfileUrl: String?
	var storyResult: StoryResult?
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		let nib = UINib(nibName: "HomeStoryCell", bundle: nil)
		self.storyCollectionView.register(nib, forCellWithReuseIdentifier: "homeStoryCell")
		self.storyCollectionView.delegate = self
		self.storyCollectionView.dataSource = self
		
	}
	
	func reloadCell() {
		self.storyCollectionView.reloadData()
	}
	
}

extension HomeStoryUpperCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return storyCount
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeStoryCell", for: indexPath) as! HomeStoryCell
		
		//		guard let result = storyResult else { return cell }
		
		if indexPath.row == 0 {
			cell.storyLbl.text = "내 스토리"
			cell.storyImg.image = UIImage(named: "profileImg")
		} else {
			
			cell.storyLbl.text = self.storyResult?.storyList[indexPath.row-1].uniqueName
			if let url = self.storyResult?.storyList[indexPath.row-1].profileImgUrl {
				if url == "" {
					cell.storyImg.image = UIImage(named: "emptyProfile")
				} else if url != "" {
					let decodedUrl = url.decodeUrl()!
					let encodedUrl = decodedUrl.encodeUrl()!
					cell.storyImg.kf.setImage(with: URL(string: encodedUrl))
				}
			}
			
		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 100, height: 120)
	}
	
}
