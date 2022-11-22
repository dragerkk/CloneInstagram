//
//  PhoneVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/10/30.
//

import UIKit

class PhoneVC: UIViewController {
	
	@IBOutlet weak var phoneTextField: UITextField!
	@IBOutlet weak var phoneBtn: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupBtn()
		self.phoneTextField.delegate = self
	}
	
	// MARK: - 버튼 설정
	private func setupBtn() {
		
		phoneBtn.tintColor = UIColor(red: 90/255, green: 202/255, blue: 254/255, alpha: 1)
		
		
		phoneBtn.isEnabled = false
		
		
	}
	
	
}


extension PhoneVC: UITextFieldDelegate {
	
	// 텍스트필드 내용없을 때 버튼 설정
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		
		let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
		
		if text.isEmpty {
			self.phoneBtn.isEnabled = false
		} else {
			self.phoneBtn.isEnabled = true
		}
		return true
	}
}

