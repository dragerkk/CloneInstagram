//
//  RegisterResponse.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/02.
//

import Foundation

//struct RegisterResponse: Decodable {
struct JoinResponse: Decodable {
	var isSuccess: Bool
	var code: Int
	var message: String
	var result: JoinResult
}

//struct RegisterResult: Decodable {
struct JoinResult: Decodable {
	var accessToken: String
}
