//
//  JoinFinalVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/02.
//

import UIKit
import Alamofire

class JoinFinalVC: UIViewController {

	@IBOutlet weak var topView: UIView!
	@IBOutlet weak var finishBtn: UIButton!
	
	//POST 관련
	var isFacebook: Bool = false
	var email: String = ""
	var password: String = ""
	var name: String = ""
	var uniqueName: String = ""
	var birthday: Date?
	
//	var dataManager: RegisterDataManager = RegisterDataManager()
	var dataManager: JoinDataManager = JoinDataManager()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationController?.isNavigationBarHidden = true
		
		print("is data sended: \(name), \(email), \(password), \(uniqueName)")

		topView.layer.borderWidth = 1
		topView.layer.borderColor = UIColor.lightGray.cgColor
      
		finishBtn.tintColor = UIColor(hex: 0x5AC9FE)
    }

	@IBAction func finishBtnAction(_ sender: UIButton) {
		
//		goToHomeVC()
//		let joinInput = RegisterRequest(email: self.email, password: self.password, name: self.name, uniqueName: self.uniqueName)
		let joinInput = JoinRequest(email: self.email, password: self.password, name: self.name, uniqueName: self.uniqueName)
		dataManager.postJoin(joinInput, delegate: self)
	}
	
}

// MARK: - 홈화면으로 이동
extension JoinFinalVC {
	func goToHomeVC() {
		let storyboard = UIStoryboard(name: "App", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "homeInitVC")

		vc.modalPresentationStyle = .fullScreen
		self.present(vc, animated: true)
		
	}
}

// MARK: - Join
extension JoinFinalVC {
	
	func didSuccessJoin(token: String) {
		Constant.accessToken = token
		
		self.goToHomeVC()
	}
	
	func failedToRequest(message: String) {
		let alert = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: UIAlertController.Style.alert)
		let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
		}
		alert.addAction(okAction)
		present(alert, animated: false)
	}
}
