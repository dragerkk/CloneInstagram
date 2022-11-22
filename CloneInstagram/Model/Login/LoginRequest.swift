//
//  LoginRequest.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/01.
//

import Foundation

struct LoginRequest: Encodable {
	var identity: String
	var password: String
}
