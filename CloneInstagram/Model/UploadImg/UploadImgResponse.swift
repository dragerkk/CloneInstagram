//
//  UploadImgResponse.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/07.
//

import Foundation

struct UploadImgResponse: Decodable {
	var isSuccess: Bool
	var code: Int
	var message: String
	
	var result: [String]
}
