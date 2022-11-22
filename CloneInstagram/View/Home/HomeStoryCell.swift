//
//  HomeStoryCell.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/10/30.
//

import UIKit

class HomeStoryCell: UICollectionViewCell {

	@IBOutlet weak var storyImg: UIImageView!
	@IBOutlet weak var storyLbl: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		
//		storyImg.layer.cornerRadius = 42
		storyImg.layer.cornerRadius = storyImg.frame.width / 2
		storyImg.layer.masksToBounds = false
		storyImg.clipsToBounds = true
		storyImg.layer.borderColor = UIColor.lightGray.cgColor
		storyImg.layer.borderWidth = 0.2
    }
	

}
