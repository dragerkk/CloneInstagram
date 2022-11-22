//
//  CommentCell.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/10.
//

import UIKit

class CommentCell: UITableViewCell {

	@IBOutlet weak var cellimg: UIImageView!
	
	@IBOutlet weak var cellLbl: UILabel!
	
	@IBOutlet weak var timeLbl: UILabel!
	@IBOutlet weak var likeLbl: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        
		self.cellimg.layer.cornerRadius = self.cellimg.frame.width/2
		
		setupLbl()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
	
	private func setupLbl() {
		let aa = "asdfasdf"
		let bb = "fkjadklfjadklfhjaskldjfhklasdjhfasdk  asdkfjhaadsfhfjkasdfhladuifhaklsdjvhlkadhvkljasdhvjkldhasvkljhasdklfhlaksdhfklasdjhvkjadshvjkh asdhjf kajdh klasdhf kasdhf lkasdjhfasdufhiquerhf iladhasdkf"
		
		let str = aa + " " + bb
		cellLbl.text = str
		cellLbl.bold(targetString: aa)
	}
    
}
