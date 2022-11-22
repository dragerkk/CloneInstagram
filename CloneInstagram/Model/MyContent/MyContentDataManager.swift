//
//  MyContentDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/07.
//

import Foundation
import Alamofire

class MyContentDataManager {
	let url = "\(Constant.BASE_URL)/api/posts/user"
	
//	func getProfileData(delegate: MyContentVC) {
	func getMyData(delegate: MyContentVC) {
		AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["X-ACCESS-TOKEN":Constant.accessToken ?? "jwt"])
			.validate()
			.responseDecodable(of: MyContentResponse.self) { response in
				switch response.result {
				case .success(let response):
					if response.isSuccess {
						delegate.didGetContent(result: response.result!)
						print("Profile API 연결 성공")
					} else {
						print("데이터 로드 실패")
						delegate.failedToRequest(message: response.message)
					}
				case .failure(let error):
					print("Profile API 연결 실패")
					delegate.failedToRequest(message: error.localizedDescription)
				}
			}
	}
}
