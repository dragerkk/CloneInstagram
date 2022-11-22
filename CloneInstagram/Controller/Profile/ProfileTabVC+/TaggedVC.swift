//
//  TaggedVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/02.
//

import UIKit
import Kingfisher

class TaggedVC: UIViewController {

	@IBOutlet weak var taggedCollectionView: UICollectionView!
	
	var myTaggedContent: [String] = ["sun.min", "cloud.fill", "sun.max", "cloud.fill"]
	
	var taggedData: [TaggedResult]?
	var dataManager: TaggedDataManager = TaggedDataManager()
	var dataCount: Int = 3
	
	override func viewWillAppear(_ animated: Bool) {
		self.dataManager.getTaggedData(delegate: self)
	}
	override func viewDidLoad() {
        super.viewDidLoad()

		taggedCollectionView.register(UINib(nibName: "TaggedCell", bundle: nil), forCellWithReuseIdentifier: "taggedCell")
		
		self.taggedCollectionView.delegate = self
		self.taggedCollectionView.dataSource = self
    }

}

// MARK: - collectionview setup
extension TaggedVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return dataCount
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = taggedCollectionView.dequeueReusableCell(withReuseIdentifier: "taggedCell", for: indexPath) as! TaggedCell
		
		// test
//		cell.cellImg.image = UIImage(systemName: myTaggedContent[indexPath.row])
		if let url = self.taggedData?[indexPath.row].imgUrls[0] {
			let decodedUrl = url.decodeUrl()!
			let encodedUrl = decodedUrl.encodeUrl()!
			
			cell.cellImg.kf.setImage(with: URL(string: encodedUrl))
		} else {
			cell.cellImg.image = UIImage(named: myTaggedContent[indexPath.row])
		}
		
			
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: self.view.frame.width / 3 - 2, height: self.view.frame.width / 3 - 2)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
}


// MARK: - api 관련
extension TaggedVC {
	
	func didSuccessGetData(result: [TaggedResult]) {
		print("tagged api connected.")
		print("result: \(result)")
		
		self.taggedData = result
		self.dataCount = result.count
//		print("result url : \(self.taggedData?[0].imgUrls)")
		self.taggedCollectionView.reloadData()
	}
}
