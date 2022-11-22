//
//  RegisterDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/02.
//

import Foundation
import Alamofire

//class RegisterDataManager {
class JoinDataManager {
	
	let url: String = Constant.BASE_URL + "/api/auth/join"
	
	func postJoin(_ parameters: JoinRequest, delegate: JoinFinalVC) {
		
		AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
			.validate()
//			.responseDecodable(of: RegisterResponse.self) {
			.responseDecodable(of: JoinResponse.self) {
				response in
				switch response.result {
				case .success(let response):
					if response.isSuccess {
						let jwtToken = response.result.accessToken
						delegate.didSuccessJoin(token: jwtToken)
						print("join success.")
					} else {
						let errorMsg = response.message
						delegate.failedToRequest(message: errorMsg)
						debugPrint(response)
						print(response.code)
					}
				case .failure(let error):
					print("Join Error: \(error.localizedDescription)")
					delegate.failedToRequest(message: "서버연결 실패")
				}
			}
	}
}

