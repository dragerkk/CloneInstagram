//
//  LoginResponse.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/01.
//

import Foundation

struct LoginResponse: Decodable {
	var isSuccess: Bool
	var code: Int
	var message: String
	var result: LoginResult
}

struct LoginResult: Decodable {
	var accessToken: String
	var name: String
}
