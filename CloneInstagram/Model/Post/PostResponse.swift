//
//  PostResponse.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/06.
//

import Foundation

struct PostResponse: Decodable {
	var isSuccess: Bool
	var code: Int
	var message: String
	var result: Int
}
