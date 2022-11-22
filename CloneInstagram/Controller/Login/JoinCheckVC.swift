//
//  JoinCheckVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/02.
//

import UIKit

class JoinCheckVC: UIViewController {

	@IBOutlet weak var confirmLbl: UILabel!
	@IBOutlet weak var loginBtn: UIButton!
	
	@IBOutlet weak var joinBtn: UIButton!
	
	var nickName: String = "nil"
	
	var email: String = ""
	var password: String = ""
	var name: String = ""
	var birthday: Date?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		self.navigationController?.isNavigationBarHidden = true
		
		loginBtn.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
			var outgoing = incoming
			outgoing.font = UIFont.systemFont(ofSize: 12)
			return outgoing
		}
		
		joinBtn.tintColor = UIColor(hex: 0x5AC9FE)

    }

	override func viewWillAppear(_ animated: Bool) {
		confirmLbl.text = nickName + "님으로 가입하시겠어요?"
	}

	@IBAction func joinBtnAction(_ sender: UIButton) {
		
		let joinFinalVC = JoinFinalVC()
		joinFinalVC.email = self.email
		joinFinalVC.name = self.name
		joinFinalVC.password = self.password
		joinFinalVC.uniqueName = self.nickName
		
		self.navigationController?.pushViewController(joinFinalVC, animated: true)
	}
	
	@IBAction func loginBtnAction(_ sender: UIButton) {
		
		self.navigationController?.popToRootViewController(animated: true)
	
	}
	
}
