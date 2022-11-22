//
//  PostRequest.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/06.
//

import Foundation

struct PostRequest: Encodable {
	var content: String
	var imgUrls: [String]
	var hashtags: [String] = []
}
