//
//  PWFindVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/10.
//

import UIKit

class PWFindVC: UIViewController {

	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var nextBtn: UIButton!
	
	@IBOutlet weak var pwBtn: UIButton!
	@IBOutlet weak var backBtn: UIButton!
	
	@IBOutlet weak var bottomView: UIView!
	override func viewDidLoad() {
        super.viewDidLoad()

		self.navigationController?.isNavigationBarHidden = true
		setupBtn()
		self.textField.delegate = self
		
    }

	private func setupBtn() {
		self.nextBtn.tintColor = UIColor(hex: 0x5AC9FE)
		self.nextBtn.isEnabled = false
		
		self.pwBtn.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer {
			input in
			var output = input
			output.font = UIFont.systemFont(ofSize: 12)
			return output
		}
		
		self.backBtn.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer {
			input in
			var output = input
			output.font = UIFont.systemFont(ofSize: 14)
			return output
		}
		
	}
	
	@IBAction func backBtnAction(_ sender: UIButton) {
		
		self.navigationController?.popViewController(animated: true)
	}
	
}

extension PWFindVC: UITextFieldDelegate {
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
