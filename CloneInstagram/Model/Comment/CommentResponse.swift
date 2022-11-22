//
//  CommentResponse.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/10.
//

import Foundation

struct CommentResponse: Decodable {
	var isSuccess: Bool
	var code: Int
	var message: String
	var result: [CommentResult]?
}

struct CommentResult: Decodable {
	var comment: Comment
	var recomment: [Recomment]?
}
