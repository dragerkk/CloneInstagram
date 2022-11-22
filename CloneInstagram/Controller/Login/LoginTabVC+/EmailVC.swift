//
//  EmailVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/10/30.
//

import UIKit

class EmailVC: UIViewController {
	
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var emailBtn: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupBtn()
		self.emailTextField.delegate = self
	}
	
	
	@IBAction func emailBtnAction(_ sender: UIButton) {
		
		let nameVC = NameVC()
		nameVC.email = emailTextField.text!
		self.navigationController?.pushViewController(nameVC, animated: true)
	}
	
	// MARK: - 버튼 설정
	private func setupBtn() {
		//색상
		emailBtn.tintColor = UIColor(red: 90/255, green: 202/255, blue: 254/255, alpha: 1)
		emailBtn.isEnabled = false

	}
	
	
}

extension EmailVC: UITextFieldDelegate {
	
	// 텍스트필드 내용없을 때 버튼 설정
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		
		let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
		
		if text.isEmpty {
			self.emailBtn.isEnabled = false
		} else {
			self.emailBtn.isEnabled = true
		}
		return true
	}
}

