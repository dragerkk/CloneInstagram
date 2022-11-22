//
//  TaggedResponse.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/09.
//

import Foundation

struct TaggedResponse: Decodable {
	var isSuccess: Bool
	var code: Int
	var message: String
	
	var result: [TaggedResult]
}

struct TaggedResult: Decodable {
	
	var postId: Int
	var profileImg: String
	var uniqueName: String
	var imgUrls: [String]
	
	var isLike: Bool?
	var postLikeUsernames: [String]
	var postLikeCount: Int?
	var content: String
	
	var comments: [Comments]?
	
	var date: String?
}
