//
//  NicknameVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/02.
//

import UIKit

class NicknameVC: UIViewController {

	@IBOutlet weak var nextBtn: UIButton!
	
	@IBOutlet weak var nameTextField: UITextField!
	
	var email: String = ""
	var name: String = ""
	var password: String = ""
	var birthday: Date?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		self.navigationController?.isNavigationBarHidden = true
		
		self.nextBtn.tintColor = UIColor(hex: 0x5AC9FE)
		self.nextBtn.isEnabled = false

		self.nameTextField.delegate = self
    }

	@IBAction func nextBtnAction(_ sender: UIButton) {
		
		let joinVC = JoinCheckVC()
		
		
		joinVC.email = self.email
		joinVC.name = self.name
		joinVC.password = self.password
		joinVC.nickName = self.nameTextField.text!
		
		self.navigationController?.pushViewController(joinVC, animated: true)
		
		
	}
	
	@IBAction func loginAction(_ sender: UIButton) {
		self.navigationController?.popToRootViewController(animated: true)
	}
	
}

extension NicknameVC: UITextFieldDelegate {
	
	// 텍스트필드 내용없을 때 버튼 설정
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		
		let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
		
		if text.isEmpty {
			self.nextBtn.isEnabled = false
		} else {
			self.nextBtn.isEnabled = true
		}
		return true
	}
}
