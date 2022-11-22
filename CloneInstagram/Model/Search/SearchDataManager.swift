//
//  SearchDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/11.
//

import Foundation
import Alamofire

class SearchDataManager {
	let url = Constant.BASE_URL + "/api/posts/search?size=20&page=3"
	
	func getSearchData(delegate: SearchViewController) {
		
		AF.request(url, method: .get, parameters: nil,
				   encoding: JSONEncoding.default,
				   headers: ["X-ACCESS-TOKEN":Constant.accessToken ?? "jwt"])
		.validate()
		.responseDecodable(of: SearchResponse.self) {
			response in
			switch response.result {
			case .success(let response):
				if response.isSuccess {
					print("search api connected")
					delegate.didGetSearchData(result: response.result!)
				} else {
					print("search data load failed.")
				}
			case .failure(let error):
				print("search api connection failed.")
				print("error:\(error.localizedDescription)")
			}
		}
	}
}
