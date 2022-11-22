//
//  FollowVC.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/09.
//

import UIKit

class FollowVC: UIViewController {

	@IBOutlet weak var userName: UILabel!
	
	@IBOutlet weak var containerView: UIView!
	
	var name: String = "username"
	
	override func viewDidLoad() {
        super.viewDidLoad()

		userName.text = name
		self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
	@IBAction func backBtnAction(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
	}
	
}
