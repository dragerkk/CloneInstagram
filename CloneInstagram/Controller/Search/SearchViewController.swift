//
//  SearchViewController.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/09.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController {

	@IBOutlet weak var searchBar: UISearchBar!
	
	@IBOutlet weak var searchCollectionView: UICollectionView!
	
	var count: Int = 1
	var imgCount: Int = 0
	
	var result: [SearchResult]?
	var dataManager: SearchDataManager = SearchDataManager()
	
	override func viewWillAppear(_ animated: Bool) {
		self.dataManager.getSearchData(delegate: self)
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		searchCollectionView.delegate = self
		searchCollectionView.dataSource = self
		
		searchCollectionView.register(UINib(nibName: "SearchCell", bundle: nil), forCellWithReuseIdentifier: "searchCell")
        // Do any additional setup after loading the view.
    }
    
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as! SearchCell
		
		guard let result = self.result else { return cell }
		let res = result[indexPath.row]
		
		self.imgCount = res.imgUrls.count
		for i in 0..<self.imgCount {
			let url = res.imgUrls[i]
			let decUrl = url.decodeUrl()!
			let encUrl = decUrl.encodeUrl()!
			cell.cellImg.kf.setImage(with: URL(string: encUrl))
		}
		
		
		return cell
	}
//
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 2
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: self.view.frame.width / 3 - 2, height: self.view.frame.width / 3 - 2)
	}
}

// MARK: - api
extension SearchViewController {
	
	func didGetSearchData(result: [SearchResult]) {
		self.result = result
		self.count = result.count
		searchCollectionView.reloadData()
		print("searchdata data loaded.")
	}
}
