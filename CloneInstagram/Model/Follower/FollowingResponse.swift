//
//  HomeResponse.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/05.
//

import Foundation

struct FollowingResponse: Decodable {
	var isSuccess: Bool
	var code: Int
	var message: String
	var result: [FollowingResult]
}

struct FollowingResult: Decodable {
	var userId: Int
	var uniqueName: String
	var name: String
	var imgUrl: String?
}
