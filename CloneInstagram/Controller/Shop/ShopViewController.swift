//
//  ShopViewController.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/09.
//

import UIKit
import Kingfisher

class ShopViewController: UIViewController {

	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var shopCollectionView: UICollectionView!
	
	var count: Int = 10
	var shopData:[String] = []
	var dataManager: ShopDataManager = ShopDataManager()
	
	override func viewWillAppear(_ animated: Bool) {
		dataManager.getShopData(delegate: self)
	}
	override func viewDidLoad() {
        super.viewDidLoad()
		
		shopCollectionView.delegate = self
		shopCollectionView.dataSource = self
		
		shopCollectionView.register(UINib(nibName: "ShopCell", bundle: nil), forCellWithReuseIdentifier: "shopCell")

        // Do any additional setup after loading the view.
    }
    
}

extension ShopViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shopCell", for: indexPath) as! ShopCell
		
		if self.shopData.count == 0 {
			return cell
		} else {
			let decUrl = self.shopData[indexPath.row].decodeUrl()!
			let encUrl = decUrl.encodeUrl()!
			cell.cellImg.kf.setImage(with: URL(string: encUrl))
		}
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return CGSize(width: self.view.frame.width / 2 - 2, height: self.view.frame.width / 2 - 2)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 0)
	}
}

// MARK: - api
extension ShopViewController {
	
	func didGetShopData(result: ShopResponse) {
		self.shopData = result.result
		self.count = result.result.count
		
		shopCollectionView.reloadData()
	}
}
