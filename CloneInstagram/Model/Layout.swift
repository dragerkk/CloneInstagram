//
//  Layout.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/11/02.
//

import UIKit

// 컬렉션뷰 셀 인셋적용
class CollectionViewLeftAlignFlowLayout: UICollectionViewFlowLayout {
	let cellSpacing: CGFloat = 0
	
	override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
		self.minimumLineSpacing = 10.0
		self.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0.0, right: 0)
		let attributes = super.layoutAttributesForElements(in: rect)
		
		var leftMargin = sectionInset.left
		var maxY: CGFloat = -1.0
		attributes?.forEach { layoutAttribute in
			if layoutAttribute.frame.origin.y >= maxY {
				leftMargin = sectionInset.left
			}
			layoutAttribute.frame.origin.x = leftMargin
			leftMargin += layoutAttribute.frame.width + cellSpacing
			maxY = max(layoutAttribute.frame.maxY, maxY)
		}
		return attributes
	}
	
}
