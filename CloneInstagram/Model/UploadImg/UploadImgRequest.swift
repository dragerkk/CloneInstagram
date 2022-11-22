//
//  UploadImgRequest.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/07.
//

import Foundation
import Alamofire

struct UploadImgRequest: Encodable {
	
//	var fileList: [String]
//	var imgList: [MultipartFormData]
	var imgList: [Data]
}
