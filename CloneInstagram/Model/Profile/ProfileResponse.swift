//
//  ProfileResponse.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/03.
//

import Foundation

struct ProfileResponse: Decodable {
	var isSuccess: Bool
	var code: Int
	var message: String
	var result: ProfileResult
}

struct ProfileResult: Decodable {
	var uniqueName: String
	var name: String
	var imgUrl: String?
	var postCount: Int
	var followingCount: Int
	var followerCount: Int
}
