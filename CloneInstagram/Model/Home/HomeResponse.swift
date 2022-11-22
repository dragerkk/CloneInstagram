//
//  HomeResponse.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/05.
//

import Foundation

struct HomeResponse: Decodable {
	var isSuccess: Bool
	var code: Int
	var message: String
	var result: [HomeResult]?
}

struct HomeResult: Decodable {
	var postId: Int
	var profileImg: String
	var uniqueName: String
	var imgUrls: [String]
	var isLike: Bool
	var postLikeUsernames: [String]
	var postLikeCount: Int?
	var content: String
	var hashtags: [String]?

	var comments: [Comments]?
//	var recomment: Recomment?
	
	var date: String?
}

struct Comments: Decodable {
	
	var comment: Comment?
	var recomment: [Recomment]?
}

struct Comment: Decodable {
	
	var commentId: Int?
	var profileImg: String?
	var name: String?
	var content: String?
	var likeCount: Int?
	var timeDiff: String?
	var isLike: Bool?

}

struct Recomment: Decodable {
	var commentId: Int?
	var recommentId: Int?
	var profileImg: String?
	var name: String?
	var content: String?
	var likeCount: Int?
	var timeDiff: String?
	var isLike: Bool?
}
