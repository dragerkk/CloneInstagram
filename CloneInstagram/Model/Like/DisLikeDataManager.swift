//
//  DisLikeDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/09.
//

import Foundation
import Alamofire

class DisLikeDataManager {
	
	let url = Constant.BASE_URL + "/api/posts/like/"
	
	func PostDisLike(postId: String, delegate: HomeCell) {
		AF.request(url+postId, method: .delete, parameters: nil, headers: ["X-ACCESS-TOKEN":Constant.accessToken ?? "jwt"])
			.validate()
			.responseDecodable(of: DisLikeResponse.self) {
			response in
				switch response.result {
				case .success(let response):
					if response.isSuccess {
						print("like count down")
					} else {
						print("failed to like count change")
					}
				case .failure(let error):
					print("ERROR: \(error.localizedDescription)")
					debugPrint(response)
				}
			}
	}
}
