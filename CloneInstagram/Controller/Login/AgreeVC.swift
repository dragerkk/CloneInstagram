//
//  AgreeVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/02.
//

import UIKit

class AgreeVC: UIViewController {
	
	@IBOutlet weak var centerView: UIView!
	
	@IBOutlet weak var btnOne: UIButton!
	@IBOutlet weak var btnTwo: UIButton!
	@IBOutlet weak var btnThree: UIButton!
	
	@IBOutlet weak var nextBtn: UIButton!
	
	@IBOutlet weak var switchAll: UISwitch!
	@IBOutlet weak var switchOne: UISwitch!
	@IBOutlet weak var switchTwo: UISwitch!
	@IBOutlet weak var switchThree: UISwitch!
	
	var email: String = ""
	var name: String = ""
	var password: String = ""
	var birthday: Date?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationController?.isNavigationBarHidden = true
		
		centerView.layer.borderWidth = 1
		centerView.layer.borderColor = UIColor.lightGray.cgColor
		
		setupBtn(btn: btnOne)
		setupBtn(btn: btnTwo)
		setupBtn(btn: btnThree)
		
		self.nextBtn.isEnabled = false
		nextBtn.tintColor = UIColor(hex: 0x5AC9FE)
	}
	
	private func setupBtn(btn: UIButton) {
		btn.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
			var outgoing = incoming
			outgoing.font = UIFont.systemFont(ofSize: 14)
			return outgoing
		}
		btn.tintColor = UIColor(hex: 0x00005A)
	}
	
	@IBAction func switchAllAction(_ sender: UISwitch) {
		
		if sender.isOn {
			switchOne.isOn = true
			switchTwo.isOn = true
			switchThree.isOn = true
			self.nextBtn.isEnabled = true
		} else {
			switchOne.isOn = false
			switchTwo.isOn = false
			switchThree.isOn = false
			self.nextBtn.isEnabled = false
		}
	}
	
	@IBAction func switchAction(_ sender: UISwitch) {
		
		if !switchOne.isOn || !switchTwo.isOn || !switchThree.isOn {
			self.nextBtn.isEnabled = false
		} else if switchOne.isOn && switchTwo.isOn && switchThree.isOn {
			self.nextBtn.isEnabled = true
		}
		
	}
	
	
	
	@IBAction func nextBtnAction(_ sender: UIButton) {
		let nicknameVC = NicknameVC()
		
		nicknameVC.email = self.email
		nicknameVC.name = self.name
		nicknameVC.password = self.password
		
		self.navigationController?.pushViewController(nicknameVC, animated: true)
	}
	
}
