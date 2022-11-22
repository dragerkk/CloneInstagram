//
//  String.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/06.
//

import UIKit

extension String {
	
	//url 한글처리 관련
	
	// 서버로부터 디코딩
	func decodeUrl() -> String? {
		return self.removingPercentEncoding
	}
	
	// 한글부분 인코딩
	func encodeUrl() -> String? {
		return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
	}
}
