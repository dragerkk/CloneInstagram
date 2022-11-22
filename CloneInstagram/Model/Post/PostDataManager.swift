//
//  PostDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/06.
//

import Foundation
import Alamofire

class PostDataManager {
	
	let url: String = Constant.BASE_URL + "/api/posts"
	
	func postContent(parameters: PostRequest, delegate: RegisterViewController) {
		AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: ["X-ACCESS-TOKEN":Constant.accessToken ?? "jwt"])
			.validate()
			.responseDecodable(of: PostResponse.self) {
				response in
				switch response.result {
				case .success(let response):
					if response.isSuccess {
						delegate.didSuccessUpload()
						print("Post content success.")
					} else {
						print("failed to post : \(response.message)")
					}
				case .failure(let error):
					print("ERROR: \(error.localizedDescription)")
					//					delegate.didFailedToRequest(message: "서버연결실패")
				}
			}
	}
}
