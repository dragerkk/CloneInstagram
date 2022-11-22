//
//  PasswordVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/10/30.
//

import UIKit

class PasswordVC: UIViewController {

	@IBOutlet weak var pwBtn: UIButton!
	
	@IBOutlet weak var nextBtn: UIButton!
	
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBOutlet weak var pwShowBtn: UIButton!
	
	var email: String = ""
	var name: String = ""
	
	override func viewDidLoad() {
        super.viewDidLoad()

		self.navigationController?.isNavigationBarHidden = true
        setupBtn()
		self.nextBtn.isEnabled = false
		self.passwordTextField.delegate = self
		self.pwBtn.isSelected = true
    }

	@IBAction func pwBtnAction(_ sender: UIButton) {
		sender.isSelected.toggle()
		
		let checkImg = pwBtn.isSelected ? "checkmark.square.fill" : "checkmark.square"
		pwBtn.setImage(UIImage(systemName: checkImg), for: .normal)
		
	}
	
	@IBAction func pwShowBtnAction(_ sender: UIButton) {
		passwordTextField.isSecureTextEntry.toggle()
		pwShowBtn.isSelected.toggle()
		
		let eyeImg = pwShowBtn.isSelected ? "pwShow" : "pwHide"
		pwShowBtn.setImage(UIImage(named: eyeImg), for: .normal)
		
	}
	
	@IBAction func loginAction(_ sender: UIButton) {
		
		self.navigationController?.popToRootViewController(animated: true)
	}
	
	// MARK: - button setup
	private func setupBtn() {
		self.pwBtn.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
			var outgoing = incoming
			outgoing.font = UIFont.systemFont(ofSize: 12)
			
			return outgoing
		}
		
		pwBtn.tintColor = .clear
		nextBtn.tintColor = UIColor(hex: 0x5AC9FE)


	}
	
	
	@IBAction func nextBtnAction(_ sender: UIButton) {
		
		// go to BirthVC
		let birthVC = BirthVC()
		birthVC.email = self.email
		birthVC.name = self.name
		birthVC.password = self.passwordTextField.text!
		self.navigationController?.pushViewController(birthVC, animated: true)
	}
	

}

extension PasswordVC: UITextFieldDelegate {
	
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
