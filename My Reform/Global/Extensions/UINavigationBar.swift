//
//  UINavigationBar.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/19.
//

import UIKit

let navigationNormalHeight: CGFloat = 44
let navigationExtendHeight: CGFloat = 84

extension UINavigationBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var barHeight: CGFloat = navigationNormalHeight
    
        if size.height == navigationExtendHeight {
            barHeight = size.height
        }
    
        let newSize: CGSize = CGSize(width: self.frame.size.width, height: barHeight)
        return newSize
    }
}
