//
//  ReelsDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/11.
//

import Foundation
import Alamofire

class ReelsDataManager {
	let url = Constant.BASE_URL + "/api/reels?size=3&page=2"
	
	func getReelsData(delegate: ReelsViewController) {
		AF.request(url, method: .get, parameters: nil,
				   encoding: JSONEncoding.default, headers: ["X-ACCESS-TOKEN":Constant.accessToken ?? "jwt"])
		.validate()
		.responseDecodable(of: ReelsResponse.self) {
			response in
			switch response.result {
			case .success(let response):
				if response.isSuccess {
					delegate.didGetReelsData(result: response.result!)
					print("릴스 api 연결 성공")
				} else {
					print("릴스 데이터 로드 실패")
				}
			case .failure(let error):
				print("릴스 api 연결 실패")
				debugPrint(response)
			}
		}
	}
}
