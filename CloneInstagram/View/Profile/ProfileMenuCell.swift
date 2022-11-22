//
//  ProfileMenuCell.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/03.
//

import UIKit

class ProfileMenuCell: UITableViewCell {

	@IBOutlet weak var cellImg: UIImageView!
	@IBOutlet weak var cellLbl: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
