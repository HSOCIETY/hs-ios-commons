//
//  UIColor_Extension.swift
//  SkyPeople
//
//  Created by yoseop park on 2017. 12. 21..
//  Copyright © 2017년 HSOCIETY. All rights reserved.
//

import UIKit

extension UIColor {

    static let spMain = rgb(94.0, 72.0, 170.0, 1.0)
    static let spWhite = UIColor.white
    static let spDark = rgbAll(19.0, 1.0)
    static let spBlack = rgbAll(50.0, 1.0)

    static let spLightGray = rgbAll(233.0, 1.0) // 좀더 밝은 색 >> rgbAll(241.0, 1.0)
    static let spMiddleGray = rgbAll(177.0, 1.0) // 좀더 밝은 색 >> rgbAll(241.0, 1.0)
    static let spDarkGray = rgbAll(102.0, 1.0)

    static let spRed = rgb(242.0, 66.0, 75.0, 1.0)
    static let spPink = rgb(255.0, 129.0, 111.0, 1.0)
    static let spGreen = rgb(38.0, 180.0, 135.0, 1.0)
    static let spSkyBlue = rgb(93.0, 143.0, 231.0, 1.0)

    class func rgbAll(_ all: CGFloat, _ alpha: CGFloat) -> UIColor {
        return UIColor(red: all/255.0, green: all/255.0, blue: all/255.0, alpha: alpha)
    }

    class func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ alpha: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
}
