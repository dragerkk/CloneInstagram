//
//  CommentDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/10.
//

import Foundation
import Alamofire

class CommentDataManager {
	
	let url = Constant.BASE_URL + "/api/posts/comments/"
	
	func getComment(postId: String, delegate: CommentVC) {
		AF.request(url+postId, method: .get
				   , parameters: nil, encoding: JSONEncoding.default,
				   headers: ["X-ACCESS-TOKEN":Constant.accessToken ?? "jwt"])
		.validate()
		.responseDecodable(of: CommentResponse.self) {
			response in
			switch response.result {
			case .success(let response):
				if response.isSuccess {
					print("comment api connected.")
					delegate.didGetCommentData(result: response.result!)
					
				}else {
					print("data load failed.")
				}
			case .failure(let error):
				print("comment api connection failed.")
				debugPrint(response)
			}
		}
	}
}
