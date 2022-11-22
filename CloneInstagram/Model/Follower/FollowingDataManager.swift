//
//  HomeDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/05.
//

import Foundation
import Alamofire

class FollowingDataManager {
	
	let url = Constant.BASE_URL + "/api/users/following"
	
	func getHomeData(delegate: FollowingVC) {

		AF.request(url, method: .get, parameters: nil,
				   encoding: JSONEncoding.default,
				   headers: ["X-ACCESS-TOKEN":Constant.accessToken ?? "jwt"])
			.validate()
			.responseDecodable(of: FollowingResponse.self) {
				response in
				switch response.result {
				case .success(let response):
					if response.isSuccess {
						delegate.didGetFollowing(result: response.result)
						print("Home API 연결성공")
						print("\(response.result)")
					} else {
						print("Home data 로드 실패 : \(response.message)")
					}
				case .failure(let error):
					print("Home API 연결실패 : \(error.localizedDescription)")
				}
			}
	}
}
