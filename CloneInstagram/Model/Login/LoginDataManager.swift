//
//  LoginDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/01.
//

import Foundation
import Alamofire

class LoginDataManager {
	
	let url: String = Constant.BASE_URL + "/api/auth/login"
	
	func postLogin(_ parameters: LoginRequest, delegate: LoginViewController) {
		
		AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
			.validate()
			.responseDecodable(of: LoginResponse.self) { response in
				switch response.result {
				case .success(let response):
					if response.isSuccess {
						let jwtToken = response.result.accessToken
						let userName = response.result.name
						delegate.didSuccessSignIn(token: jwtToken, userName: userName)
						print("login success.")
					} else {
						let errorMsg = response.message
						delegate.failedToRequest(message: errorMsg)
					}
				case .failure(let error):
					print("Login Error: \(error.localizedDescription)")
					delegate.failedToRequest(message: "서버연결 실패")
				}
			}
	}
}
