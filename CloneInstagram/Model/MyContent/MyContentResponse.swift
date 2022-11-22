//
//  MyContentResponse.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/07.
//

import Foundation

struct MyContentResponse: Decodable {
	var isSuccess: Bool
	var code: Int
	var message: String
	var result: [MycontentResult]?
}

struct MycontentResult: Decodable {
	var profileImg: String
	var uniqueName: String
	var imgUrls: [String]
	var isLike: Bool?
	var postLikeUsernames: [String]
	var postLikeCount: Int?
	var content: String
	var hashtags: [String]?
	var comments: [Comments]?
	var date: String?
}

