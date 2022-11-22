//
//  FollowerResponse.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/09.
//

import Foundation

struct FollowerResponse: Decodable {
	var isSuccess: Bool
	var code: Int
	var message: String
	var result: [FollowerResult]
}

struct FollowerResult: Decodable {
	var userId: Int
	var uniqueName: String
	var name: String
	var imgUrl: String?
}
