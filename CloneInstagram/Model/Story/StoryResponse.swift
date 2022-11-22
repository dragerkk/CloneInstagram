//
//  StoryResponse.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/08.
//

import Foundation

struct StoryResponse: Decodable {
	var isSuccess: Bool
	var code: Int
	var message: String
	var result: StoryResult
}

struct StoryResult: Decodable {
	var profile: StoryProfile
	var storyList: [StoryList]
}

struct StoryProfile: Decodable {
	var userId: Int
	var uniqueName: String
	var profileImgUrl: String?
}

struct StoryList: Decodable {
	var userId: Int
	var uniqueName: String
	var profileImgUrl: String?
}
