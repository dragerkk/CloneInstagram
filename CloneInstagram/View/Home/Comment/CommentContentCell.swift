//
//  CommentContentCell.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/10.
//

import UIKit

class CommentContentCell: UITableViewCell {
	
	@IBOutlet weak var cellImg: UIImageView!
	
	@IBOutlet weak var cellLbl: UILabel!
	@IBOutlet weak var timeLbl: UILabel!
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        
		self.cellImg.layer.cornerRadius = self.cellImg.frame.width / 2
		
		setupLbl()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	private func setupLbl() {
		let aa = "asdfasdf"
		let bb = "fkjadklfjadklfhjaskldjfhklasdjhfasdk  asdkfjhaadsfhfjkasdfhladuifhaklsdjvhlkadhvkljasdhvjkldhasvkljhasdklfhlaksdhfklasdjhvkjadshvjkh asdhjf kajdh klasdhf kasdhf lkasdjhfasdufhiquerhf iladhasdkf"
		
		let str = aa + " " + bb
		cellLbl.text = str
		cellLbl.bold(targetString: aa)
		
	}
	
	
    
}
