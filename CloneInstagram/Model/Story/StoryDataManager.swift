//
//  StoryDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/08.
//

import Foundation
import Alamofire

class StoryDataManager {
	
	let url = Constant.BASE_URL + "/api/stories"
	
	func getStory(delegate: HomeViewController) {
	
		AF.request(url, method: .get
				   , parameters: nil, encoding: JSONEncoding.default, headers: ["X-ACCESS-TOKEN":Constant.accessToken ?? "jwt"])
		.validate()
		.responseDecodable(of: StoryResponse.self) {
			response in
			switch response.result {
			case .success(let response):
				if response.isSuccess {
					print("story API 연결성공.")
					delegate.didSuccessGetStory(result: response.result)
				} else {
					print("story API load failed.")
				}
			case .failure(let error):
				print("story API 연결실패.")
				print(error.localizedDescription)
			}
		}
	}
}
