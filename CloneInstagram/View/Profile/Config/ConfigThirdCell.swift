//
//  ConfigThirdCell.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/10.
//

import UIKit

class ConfigThirdCell: UITableViewCell {

	@IBOutlet weak var logoutBtn: UIButton!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		self.logoutBtn.setTitle((Constant.userName ?? "")+" 로그아웃", for: .normal)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
	@IBAction func logoutBtnAction(_ sender: UIButton) {
		
	}
}
