//
//  Constant.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/01.
//

import Foundation

struct Constant {
	
	static let BASE_URL = "https://prod.jaehwan.shop"
	
	// 토큰 저장
	static var accessToken: String? = UserDefaults.standard.string(forKey: "AccessToken") {
		didSet {
			guard let token = accessToken else { return }
			UserDefaults.standard.setValue(token, forKey: "AccessToken")
			print("Token saved: \(token)")
		}
	}
	
	//유저네임 저장
	static var userName: String? = UserDefaults.standard.string(forKey: "UserName") {
		didSet {
			guard let name = userName else { return }
			UserDefaults.standard.setValue(name, forKey: "UserName")
			print("UserName saved: \(name)")
		}
	}
}
