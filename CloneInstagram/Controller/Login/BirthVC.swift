//
//  BirthVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/02.
//

import UIKit

class BirthVC: UIViewController {

	@IBOutlet weak var birthBtn: UIButton!
	
	@IBOutlet weak var birthTextField: UITextField!
	@IBOutlet weak var datePicker: UIDatePicker!
	
	@IBOutlet weak var nextBtn: UIButton!
	
	var email: String = ""
	var name: String = ""
	var password: String = ""
	
	var selectedDate: Date?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationController?.isNavigationBarHidden = true

		birthBtn.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
			var outgoing = incoming
			outgoing.font = UIFont.systemFont(ofSize: 14)
			return outgoing
		}
		
		birthBtn.tintColor = UIColor(hex: 0x00005A)
		nextBtn.tintColor = UIColor(hex: 0x5AC9FE)
		
		self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
    }
	
	@objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
		let formmater = DateFormatter()
		formmater.dateFormat = "yyyy년 MM월 dd일"
		formmater.locale = Locale(identifier: "ko_KR")
		self.selectedDate = datePicker.date
		birthTextField.text = formmater.string(from: datePicker.date)
		
	}

	@IBAction func nextBtnAction(_ sender: UIButton) {
		
		let agreeVC = AgreeVC()
		agreeVC.email = self.email
		agreeVC.name = self.name
		agreeVC.password = self.password
		
		self.navigationController?.pushViewController(agreeVC, animated: true)
	}
	

}
