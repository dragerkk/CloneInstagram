//
//  DisLikeResponse.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/09.
//

import Foundation

struct DisLikeResponse: Decodable {
	
	var isSuccess: Bool
	var code: Int
	var message: String
	var result: String
}
