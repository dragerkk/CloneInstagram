//
//  RegisterViewController.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/01.
//

import UIKit
import Kingfisher

class RegisterViewController: UIViewController {
	
	@IBOutlet weak var uploadView: UIView!
	@IBOutlet weak var tagView: UIView!
	@IBOutlet weak var locationView: UIView!
	@IBOutlet weak var socialView: UIView!
	@IBOutlet weak var configView: UIView!
	
	@IBOutlet weak var uploadImg: UIImageView!
	@IBOutlet weak var uploadTextView: UITextView!
	
	@IBOutlet weak var facebookSwitch: UISwitch!
	@IBOutlet weak var twitterSwitch: UISwitch!
	@IBOutlet weak var tumblrSwitch: UISwitch!
	
	var photoUrlArr: [String] = []
	
	lazy var dataManager: PostDataManager = PostDataManager()
	
	var postData: PostRequest = PostRequest(content: "", imgUrls: [])
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView(view: uploadView)
		setupView(view: tagView)
		setupView(view: locationView)
		setupView(view: socialView)
		setupView(view: configView)
		
		setupSwitch(switches: facebookSwitch)
		setupSwitch(switches: twitterSwitch)
		setupSwitch(switches: tumblrSwitch)
		//		print("photoUrlArr: \(self.photoUrlArr)")
		
		setupImage()
	}
	
	// MARK: - set Image to ImageView
	private func setupImage() {
		let imgUrl = photoUrlArr[0]
		let url = imgUrl.decodeUrl()!
		let encodedUrl = url.encodeUrl()!
		self.uploadImg.kf.setImage(with: URL(string: encodedUrl))
	}
	
	// MARK: - Setup UI elements ( view, switch )
	private func setupView(view: UIView) {
		view.layer.borderColor = UIColor.lightGray.cgColor
		view.layer.borderWidth = 0.5
	}
	
	private func setupSwitch(switches: UISwitch) {
		switches.onTintColor = UIColor(hex: 0x87CEEB)
		switches.tintColor = UIColor(hex: 0x87CEEB)
	}
	
	@IBAction func backBtnAction(_ sender: UIButton) {
		self.dismiss(animated: true)
	}
	
	@IBAction func shareAction(_ sender: UIButton) {
		
		self.postData.content = uploadTextView.text
		self.postData.imgUrls = self.photoUrlArr
		self.dataManager.postContent(parameters: self.postData, delegate: self)
	}
	
}

// MARK: - api POST
extension RegisterViewController {
	
	func didSuccessUpload() {
		self.dismiss(animated: true)
	}
	
	func didFailedToRequest(message: String) {
		
	}
}
