//  LoginViewController.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/10/29.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

	@IBOutlet weak var IDTextField: UITextField!
	@IBOutlet weak var PWTextField: UITextField!
	
	@IBOutlet weak var PWButton: UIButton!
	
	@IBOutlet weak var joinButton: UIButton!
	@IBOutlet weak var loginButton: UIButton!
	
	@IBOutlet weak var pwShowBtn: UIButton!
	
	var dataManager: LoginDataManager = LoginDataManager()
	
	override func viewDidLoad() {
        super.viewDidLoad()

		setupBtn()
        // Do any additional setup after loading the view.
    }
	
	// 비번 보안버튼 이미지변경
	@IBAction func pwShowBtnAction(_ sender: UIButton) {
		PWTextField.isSecureTextEntry.toggle()
		pwShowBtn.isSelected.toggle()
		
		pwShowBtn.tintColor = .clear
		let eyeImg = pwShowBtn.isSelected ? "pwShow" : "pwHide"
		pwShowBtn.setImage(UIImage(named: eyeImg), for: .normal)
		
	}
	
	
	
	// MARK: - 비번찾기 버튼 설정
	private func setupBtn() {
		
		PWButton.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer {
			incoming in
			var outgoing = incoming
			outgoing.font = UIFont.systemFont(ofSize: 11)
			return outgoing
		}
		
		loginButton.tintColor = UIColor(red: 90/255, green: 202/255, blue: 254/255, alpha: 1)
		
		joinButton.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
			var outgoing = incoming
			outgoing.font = UIFont.systemFont(ofSize: 14)
			return outgoing
		}
	}
	
	@IBAction func pwBtnAction(_ sender: UIButton) {
		let vc = self.storyboard?.instantiateViewController(withIdentifier: "pwFindVC") as! PWFindVC
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	
	@IBAction func FacebookBtnAction(_ sender: UIButton) {
		goToHomeVC()
	}
	
	
	@IBAction func loginBtnAction(_ sender: UIButton) {
		
		let loginInput = LoginRequest(identity: IDTextField.text ?? "", password: PWTextField.text ?? "")
		print("login input: \(loginInput)")
		dataManager.postLogin(loginInput, delegate: self)
		  
	}
	

}

// MARK: - 홈화면으로 이동
extension LoginViewController {
	func goToHomeVC() {
		let storyboard = UIStoryboard(name: "App", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "homeInitVC")

		vc.modalPresentationStyle = .fullScreen
		self.present(vc, animated: true)

	}
}

// MARK: - Login
extension LoginViewController {
	
	func didSuccessSignIn(token: String, userName: String) {
		Constant.accessToken = token
		Constant.userName = userName
		
		let alert = UIAlertController(title: "로그인", message: "성공", preferredStyle: UIAlertController.Style.alert)
		let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
			self.goToHomeVC()
		
		}
		
		alert.addAction(okAction)
		present(alert, animated: false)
	}
	
	func failedToRequest(message: String) {
		let alert = UIAlertController(title: "로그인", message: message, preferredStyle: UIAlertController.Style.alert)
		let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
		}
		alert.addAction(okAction)
		present(alert, animated: false)
	}
}
