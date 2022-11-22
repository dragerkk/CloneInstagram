//
//  MyContentVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/02.
//

import UIKit
import Kingfisher

class MyContentVC: UIViewController {
	
	@IBOutlet weak var contentCollectionView: UICollectionView!
	
	//	var myContent: [String] = ["sun.min", "cloud.fill", "sun.max", "cloud.fill"]
	
		var myContent: [MycontentResult]?
	var dataCount: Int = 0
	lazy var dataManager: MyContentDataManager = MyContentDataManager()
	
	override func viewWillAppear(_ animated: Bool) {
		dataManager.getMyData(delegate: self)
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		
		contentCollectionView.register(UINib(nibName: "MyContentCell", bundle: nil), forCellWithReuseIdentifier: "myContentCell")
		
		self.contentCollectionView.delegate = self
		self.contentCollectionView.dataSource = self
		
	}
	
}

// MARK: - collectionview setting
extension MyContentVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return dataCount
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = contentCollectionView.dequeueReusableCell(withReuseIdentifier: "myContentCell", for: indexPath) as! MyContentCell
		
		// test
		//		cell.cellImg.image = UIImage(systemName: myContent[indexPath.row])
		guard let result = myContent else { return cell }
		if self.dataCount != 0 {
			let data = result[indexPath.row]
			
			let imgUrl = data.imgUrls[0]
			//한글주소 처리
			let decodedUrl = imgUrl.decodeUrl()!
			let encodedUrl = decodedUrl.encodeUrl()!
			cell.cellImg.kf.setImage(with: URL(string: encodedUrl))
		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//		return CGSize(width: self.view.frame.width / 3 - 6.8, height: self.view.frame.width / 3 - 6.8)
		return CGSize(width: collectionView.frame.width/3 - 2, height: collectionView.frame.height/3 - 2)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
}


// MARK: - API 관련

extension MyContentVC {
	
	func didGetContent(result: [MycontentResult]) {
		print("profileVC api connected.")
		self.myContent = result
		self.dataCount = result.count
		print("data: \(self.myContent)")
		print("data Count: \(self.dataCount)")
		
		self.contentCollectionView.reloadData()
	}
	
	func failedToRequest(message: String) {
		print(message)
	}
}
