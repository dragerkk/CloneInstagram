//
//  UploadImgDataManager.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/07.
//

import Foundation
import Alamofire
import UIKit

class UploadImgDataManager {
	
	let url: String = Constant.BASE_URL + "/api/uploadFiles"
	
	//	func uploadImg(parameters: UploadImgRequest, delegate: HomeViewController) {
	func uploadImg(parameters: UploadImgRequest, delegate: HomeViewController) {
		
		// 세번째 -- 해결
		AF.upload(multipartFormData: { multipartFormData in
			for list in parameters.imgList {
//				multipartFormData.append(list, withName: "fileList")
				multipartFormData.append(list, withName: "fileList", fileName: "file.jpg", mimeType: "image/jpeg")
				
			}
			print("check:::: \(multipartFormData)")
		}, to: url)
			.responseDecodable(of: UploadImgResponse.self) { response in
//				debugPrint(response)
				switch response.result {
				case .success(let response):
					if response.isSuccess {
						delegate.didSuccessUploadImg(result: response.result)
						print("upload success.")
					} else {
						delegate.failedToRequest(message: response.message)
					}
				case .failure(let error):
					delegate.failedToRequest(message: "upload failed.")
				}
			}
		
		
	}
				  
}
