//
//  TaggedDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/09.
//

import Foundation
import Alamofire

class TaggedDataManager {
	
	let url = Constant.BASE_URL + "/api/posts/user/206"
	
	func getTaggedData(delegate: TaggedVC) {
		AF.request(url, method: .get,
				   parameters: nil, encoding: JSONEncoding.default,
				   headers: ["X-ACCESS-TOKEN":Constant.accessToken ?? "jwt"])
		.validate()
		.responseDecodable(of: TaggedResponse.self) {
			response in
			switch response.result {
			case .success(let response):
				if response.isSuccess {
					print("Tagged API 연결 성공.")
					delegate.didSuccessGetData(result: response.result)
					
				} else {
					print("데이터 로드 실패")
				}
			case .failure(let error):
				print("Tagged API 연결 실패")
				debugPrint(response)
			}
		}
	}
}
