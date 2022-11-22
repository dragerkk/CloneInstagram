//
//  NameVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/10/30.
//

import UIKit

class NameVC: UIViewController {

	@IBOutlet weak var nextBtn: UIButton!
	@IBOutlet weak var nameTextField: UITextField!
	
	var email: String = ""
	
	override func viewDidLoad() {
        super.viewDidLoad()

		self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
		setupBtn()
		self.nameTextField.delegate = self
    }

	private func setupBtn() {
		//색상
		self.nextBtn.tintColor = UIColor(hex: 0x5AC9FE)
		self.nextBtn.isEnabled = false

	}
	
	@IBAction func loginAction(_ sender: UIButton) {
		self.navigationController?.popToRootViewController(animated: true)
	}
	
	@IBAction func nextBtnAction(_ sender: UIButton) {
		
		let pwVC = PasswordVC()
		pwVC.email = self.email
		pwVC.name = self.nameTextField.text!
		self.navigationController?.pushViewController(pwVC, animated: true)
	}
}

extension NameVC: UITextFieldDelegate {
	
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

