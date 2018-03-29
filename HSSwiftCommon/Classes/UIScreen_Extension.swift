//
//  UIScreen_Extension.swift
//  SkyPeople
//
//  Created by yoseop park on 2018. 3. 26..
//  Copyright © 2018년 HSOCIETY. All rights reserved.
//

import UIKit

extension UIScreen {
    /*
     414x736 8+
     375x667 8s
     320x568 SE
     320x480 4s iOS9.x
     */
    public static var width = UIScreen.main.bounds.size.width
    public static var height = UIScreen.main.bounds.size.height
    public static var iPhone4: Bool { return UIScreen.height <= 480 }
    public static var underSE: Bool { return UIScreen.width < 375 }
    public static var overIPhone8: Bool { return UIScreen.width >= 375 }
    public static var iPhone8: Bool { return UIScreen.width == 375 }
    public static var iPhone8Plus: Bool { return UIScreen.width == 414 }
    public static var iphoneX: Bool { return UIScreen.main.nativeBounds.height == 2436 }
}
