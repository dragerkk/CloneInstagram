//
//  FollowerCell.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/09.
//

import UIKit

class FollowerCell: UITableViewCell {
	
	@IBOutlet weak var profileImg: UIImageView!
	@IBOutlet weak var nameLbl: UILabel!
	@IBOutlet weak var uniqueNameLbl: UILabel!
	
	@IBOutlet weak var followBtn: UIButton!
	
	@IBOutlet weak var deleteBtn: UIButton!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		followBtn.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer {
			incoming in
			var outgoing = incoming
			outgoing.font = UIFont.systemFont(ofSize: 17)
			return outgoing
		}
		
		profileImg.layer.cornerRadius = profileImg.frame.width/2
		
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
