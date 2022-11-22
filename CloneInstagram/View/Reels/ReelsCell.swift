//
//  ReelsCell.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/11.
//

import UIKit

class ReelsCell: UICollectionViewCell {
	
	@IBOutlet weak var titleLbl: UILabel!
	
	@IBOutlet weak var bgImg: UIImageView!
	
	@IBOutlet weak var likeLbl: UILabel!
	
	@IBOutlet weak var chatLbl: UILabel!
	@IBOutlet weak var sqProfileImg: UIImageView!
	
	@IBOutlet weak var musicBtn: UIButton!
	@IBOutlet weak var nameBtn: UIButton!
	
	@IBOutlet weak var profileImg: UIImageView!
	@IBOutlet weak var nameLbl: UILabel!
	
	@IBOutlet weak var followBtn: UIButton!
	
	@IBOutlet weak var contentLbl: UILabel!
	
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        
		setupUI()
		
    }
	
	
	private func setupUI() {
		
		// Profile img & sq profile img
		self.profileImg.layer.cornerRadius = self.profileImg.frame.width/2
		self.profileImg.layer.borderWidth = 1
		self.profileImg.layer.borderColor = UIColor.white.cgColor
		
		self.sqProfileImg.layer.cornerRadius = 5
		self.sqProfileImg.layer.borderColor = UIColor.white.cgColor
		self.sqProfileImg.layer.borderWidth = 2
		
		// follow btn
		self.followBtn.layer.cornerRadius = 5
		self.followBtn.layer.borderColor = UIColor.white.cgColor
		self.followBtn.layer.borderWidth = 0.5
		
	}
	

}
