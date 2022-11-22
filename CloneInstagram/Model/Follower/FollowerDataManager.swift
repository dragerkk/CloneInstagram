//
//  FollowerDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/09.
//

import Foundation
import Alamofire

class FollowerDataManager {
	
	let url = Constant.BASE_URL + "/api/users/follower"
	
	func getFollowerData(delegate: FollowerVC) {
		
		AF.request(url, method: .get, parameters: nil,
				   encoding: JSONEncoding.default, headers: ["X-ACCESS-TOKEN":Constant.accessToken ?? "jwt"])
		.validate()
		.responseDecodable(of: FollowerResponse.self) {
			response in
			switch response.result {
			case .success(let response):
				if response.isSuccess {
					delegate.didGetFollower(result: response.result)
				print("follower api connected.")
				} else {
					print("data load failed : \(response.message)")
				}
			case .failure(let error):
				print("pollower api connection failed.")
//				debugPrint(response)
				print("error: \(error.localizedDescription)")
			}
		
		}
	}
}
