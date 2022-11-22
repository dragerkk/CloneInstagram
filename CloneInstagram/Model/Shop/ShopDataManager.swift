//
//  ShopDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/09.
//

import Foundation
import Alamofire

class ShopDataManager {

	let url = Constant.BASE_URL + "/api/shop"
	
	func getShopData(delegate: ShopViewController) {
		AF.request(url, method: .get, parameters: nil,
				   encoding: JSONEncoding.default, headers: ["X-ACCESS-TOKEN":Constant.accessToken ?? "jwt"])
		.validate()
		.responseDecodable(of: ShopResponse.self) {
			response in
			switch response.result {
			case .success(let response):
				if response.isSuccess {
					print("shop api connected.")
					delegate.didGetShopData(result: response)
				} else {
					print("shop api load failed.")
				}
			case .failure(let error):
				print("shop api connection failed.")
				print(error.localizedDescription)
			}
		}
	}
}
