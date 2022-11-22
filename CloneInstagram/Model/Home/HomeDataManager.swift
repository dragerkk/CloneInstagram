//
//  HomeDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/05.
//

import Foundation
import Alamofire

class HomeDataManager {
	let url = "\(Constant.BASE_URL)/api/posts?size=10&page=0"
//	let url = "https://prod.jaehwan.shop/api/posts/7"
	
	func getHomeData(delegate: HomeViewController) {
		AF.request(url, method: .get
				   , parameters: nil, encoding: JSONEncoding.default,
				   headers: ["X-ACCESS-TOKEN":Constant.accessToken ?? "jwt"])
		.validate()
		.responseDecodable(of: HomeResponse.self) { response in
			switch response.result {
			case .success(let response):
				if response.isSuccess {
					delegate.didSuccessConnect(result: response.result!)
					print("Home API 연결 성공.")
//					print("\(response.result)")
				} else {
					print("데이터 로드 실패")
					delegate.failedToRequest(message: response.message)
				}
			case .failure(let error):
				print("Home API 연결 실패.")
//				print("URL:\(self.url)")
				delegate.failedToRequest(message: error.localizedDescription)
				switch error {
				case .invalidURL(let url):
					print("Invalid URL: \(url) - \(error.localizedDescription)")
				case .parameterEncodingFailed(let reason):
					print("Parameter encoding failed: \(error.localizedDescription)")
					print("Failure Reason: \(reason)")
				case .multipartEncodingFailed(let reason):
					print("Multipart encoding failed: \(error.localizedDescription)")
					print("Failure Reason: \(reason)")
				case .responseValidationFailed(let reason):
					print("Response validation failed: \(error.localizedDescription)")
					print("Failure Reason: \(reason)")
					
					switch reason {
					case .dataFileNil, .dataFileReadFailed:
						print("Downloaded file could not be read")
					case .missingContentType(let acceptableContentTypes):
						print("Content Type Missing: \(acceptableContentTypes)")
					case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
						print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
					case .unacceptableStatusCode(let code):
						print("Response status code was unacceptable: \(code)")
//						statusCode = code
					case .customValidationFailed(error: let error):
						print("aldksfj")
					}
				case .responseSerializationFailed(let reason):
					print("Response serialization failed: \(error.localizedDescription)")
					print("Failure Reason: \(reason)")
					// statusCode = 3840 ???? maybe..
				default:break
				}
				
				print("Underlying error: \(error.underlyingError)")
				
			}
			
		}
	}
}

