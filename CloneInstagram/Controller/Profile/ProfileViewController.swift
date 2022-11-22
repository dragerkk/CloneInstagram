//
//  ProfileViewController.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/02.
//

import UIKit

class ProfileViewController: UIViewController {
	
	@IBOutlet weak var userNameBtn: UIButton!
	
	@IBOutlet weak var profileRegisterBtn: UIButton!
	@IBOutlet weak var profileMenuBtn: UIButton!
	
	@IBOutlet weak var profileImgView: UIImageView!
	@IBOutlet weak var uniqueNameLbl: UILabel!
	@IBOutlet weak var introduceLbl: UILabel!
	
	
	@IBOutlet weak var contentLbl: UILabel!
	@IBOutlet weak var followerLbl: UILabel!
	@IBOutlet weak var followingLbl: UILabel!
	
	@IBOutlet weak var contentBtn: UIButton!
	@IBOutlet weak var followerBtn: UIButton!
	@IBOutlet weak var followingBtn: UIButton!
	
	@IBOutlet weak var profileEditBtn: UIButton!
	
	// profile 정보 관련
	var name: String = "userName "
	var uniqueName: String = "uniqueName"
	var postCount:Int = 0
	var followingCount:Int = 0
	var followerCount:Int = 0
	var imgUrl:String?
	
	lazy var dataManager: ProfileDataManager = ProfileDataManager()
	
//	// 본인 게시글 관련
//	var myContent: [MycontentResult]?
	
	override func viewWillAppear(_ animated: Bool) {
		dataManager.getProfile(delegate: self)
//		setupUI()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		setupButton()
//		setupUI()
		self.navigationController?.isNavigationBarHidden = true
	}
	
	// MARK: - UI - api 연결
	private func setupUI() {
		
//		if let profileImg = imgUrl {
//			profileImgView.image = UIImage(named: profileImg)
//		}
		guard let img = self.imgUrl else { return }
		let decodedUrl = img.decodeUrl()!
		let encodedUrl = decodedUrl.encodeUrl()!
		
		profileImgView.kf.setImage(with: URL(string: encodedUrl))
		profileImgView.layer.cornerRadius = profileImgView.frame.width / 2
		
		introduceLbl.text = ""
		
		userNameBtn.titleLabel?.text = self.name
		
		uniqueNameLbl.text = self.uniqueName
//		introduceLbl.text = self.
		contentLbl.text = String(self.postCount)
		followerLbl.text = String(self.followerCount)
		followingLbl.text = String(self.followingCount)
		
	}
	
	@IBAction func registerBtnAction(_ sender: UIButton) {
		
//		print("registerBtn clicked.")
		showRegisterSheet()
	}
	
	@IBAction func menuBtnAction(_ sender: UIButton) {
//		print("menuBtn clicked.")
		showMenuSheet()
	}
	
//	// Follow Action
	@IBAction func followAction(_ sender: UIButton) {

		let vc = self.storyboard!.instantiateViewController(withIdentifier: "followVC") as! FollowVC
		vc.name = self.name
		
		self.navigationController?.pushViewController(vc, animated: true)

	}
	
	
}

// MARK: - register button / menu button popup
extension ProfileViewController {
	
	func showRegisterSheet() {
		
		let viewControllerToPresent = self.storyboard!.instantiateViewController(withIdentifier: "profileRegisterVC") as! ProfileRegisterVC
		
		if let sheet = viewControllerToPresent.sheetPresentationController {
			sheet.detents = [.medium()]
			// sheet 아래 뷰를 dim처리
			sheet.prefersEdgeAttachedInCompactHeight = true
			// 그랩바
			sheet.prefersGrabberVisible = true
			
		}
		
		present(viewControllerToPresent, animated: true)
	}
	
	func showMenuSheet() {
		
		let viewControllerToPresent = self.storyboard!.instantiateViewController(withIdentifier: "profileMenuVC") as! ProfileMenuVC
		
		if let sheet = viewControllerToPresent.sheetPresentationController {
			sheet.detents = [.medium(), .large()]
			// sheet 아래 뷰를 dim처리
			sheet.prefersEdgeAttachedInCompactHeight = true
			// 그랩바
			sheet.prefersGrabberVisible = true
			
		}
		
		present(viewControllerToPresent, animated: true)

	}
	
}

// MARK: - setup button
extension ProfileViewController {
	
	
	private func setupButton() {
		
		profileEditBtn.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
			var outgoing = incoming
			outgoing.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
			return outgoing
		}
		
		userNameBtn.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
			
			var outgoing = incoming
			outgoing.font = UIFont.systemFont(ofSize: 28, weight: .bold)
			return outgoing
		}
		userNameBtn.tintColor = .black
		userNameBtn.setTitle(self.name, for: .normal)
		
		let btnArr = [contentBtn, followerBtn, followingBtn]
		
		for btn in btnArr {
			btn?.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
				var outgoing = incoming
				outgoing.font = UIFont.systemFont(ofSize: 14)
				return outgoing
			}
			btn?.tintColor = .black
		}
	}
	
}

// MARK: - API 관련
extension ProfileViewController {
	
	// profile 정보
	func didSuccessSignIn(result: ProfileResult) {
		
		self.name = result.name
		self.uniqueName = result.uniqueName
		self.imgUrl = result.imgUrl
		self.postCount = result.postCount
		self.followingCount = result.followingCount
		self.followerCount = result.followerCount
		
		print("확인용: \(self.name)")
		setupUI()
	}
	
	func failedToRequest(message: String) {
		print(message)
	}
	
	// 본인 게시글 정보
//	func didGetContent(result: [MycontentResult]) {
//		print("profileVC api connected.")
//		self.myContent = result
////		self.dataCount = result.count
//		//		print("data: \(self.profileData)")
////		print("data Count: \(self.dataCount)")
//
//	}
}
