//
//  SearchResponse.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/11.
//

import Foundation

struct SearchResponse: Decodable {
	var isSuccess: Bool
	var code: Int
	var message: String
	var result: [SearchResult]?
}

struct SearchResult: Decodable {
	var postId: Int
	var profileImg: String
	var uniqueName: String
	var imgUrls: [String]
	var isLike: Bool
	var postLikeUsernames: [String]
	var postLikeCount: Int?
	var content: String
	var hashtags: [String]
	var comments: [Comments]?
}
