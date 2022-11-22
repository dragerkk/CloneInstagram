//
//  PostDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/03.
//

import Foundation
import Alamofire

class ProfileDataManager {
	
	let url = Constant.BASE_URL + "/api/users/profile"
	
	func getProfile(delegate: ProfileViewController) {
		
		AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default,
				   headers: ["X-ACCESS-TOKEN":Constant.accessToken ?? "jwt"])
		.validate()
		.responseDecodable(of: ProfileResponse.self) { response in
			switch response.result {
			case .success(let response):
				if response.isSuccess {
					delegate.didSuccessSignIn(result: response.result)
					print("profile API 연결성공")
//					print("\(response.result)")
				} else {
					print("data load failed")
					delegate.failedToRequest(message: response.message)
				}
			case .failure(let error):
				print("profile API 연결실패")
				delegate.failedToRequest(message: error.localizedDescription)
			}
		}
		
	}
	
	func getFollowCount(delegate: FollowTabVC) {
		AF.request(url, method: .get, parameters: nil,
				   encoding: JSONEncoding.default,
				   headers: ["X-ACCESS-TOKEN":Constant.accessToken ?? "jwt"])
		.validate()
		.responseDecodable(of: ProfileResponse.self) {
			response in
			switch response.result {
			case .success(let response):
				delegate.didGetFollowCount(result: response.result)
			case .failure(let error):
				print("followcount 연결실패")
				
			}
		}
	}
}
