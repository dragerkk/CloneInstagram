//
//  RegisterRequest.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/02.
//

import Foundation

//struct RegisterRequest: Encodable {
struct JoinRequest: Encodable {
	var facebook: Bool = false
	var email: String
	var password: String
	var name: String
	var uniqueName: String
	var birthday: Date?
}
