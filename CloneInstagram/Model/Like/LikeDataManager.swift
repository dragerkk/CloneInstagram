//
//  LikeDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/09.
//

import Foundation
import Alamofire

class LikeDataManager {
	
	let url = Constant.BASE_URL + "/api/posts/like/"
	
	func PostLike(postId: String, delegate: HomeCell) {
		AF.request(url+postId, method: .post, parameters: nil, headers: ["X-ACCESS-TOKEN":Constant.accessToken ?? "jwt"])
			.validate()
			.responseDecodable(of: LikeResponse.self) {
				response in
				switch response.result {
				case .success(let response):
					if response.isSuccess {
						print("like count up")
					} else {
						print("failed to like count change")
					}
				case .failure(let error):
					print("안됨ERROR: \(error.localizedDescription)")
					debugPrint(response)
				}
			}
	}
}
