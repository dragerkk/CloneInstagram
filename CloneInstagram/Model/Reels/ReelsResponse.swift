//
//  ReelsResponse.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/11.
//

import Foundation

struct ReelsResponse: Decodable {
	var isSuccess: Bool
	var code: Int
	var message: String
	var result: [ReelsResult]?
}

struct ReelsResult: Decodable {
	var reelsId: Int
	var profileImg: String
	var uniqueName: String
	var vodUrl: String
	var isLike: Bool
	var reelsLikeUsernames: [String]
	var reelsLikeCount: Int?
	var content: String
	var hashtags: [String]
	var comments: [Comments]?
	var date: String
}
