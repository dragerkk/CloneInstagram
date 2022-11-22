//
//  Color.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/01.
//

import UIKit

extension UIColor {
	
	// MARK: - hex code를 이용하여 정의
	// ex. UIColor(hex: 0xFFFFFF)
	
	convenience init(hex: UInt, alpha: CGFloat = 1.0) {
		self.init(
			red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
			green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
			blue: CGFloat(hex & 0x0000FF) / 255.0,
			alpha: CGFloat(alpha)
		)
	}
	
}
