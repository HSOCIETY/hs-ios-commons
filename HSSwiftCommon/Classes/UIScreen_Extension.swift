//
//  UIScreen_Extension.swift
//  SkyPeople
//
//  Created by yoseop park on 2018. 3. 26..
//  Copyright © 2018년 HSOCIETY. All rights reserved.
//

import UIKit

public extension UIScreen {
    /*
     414x736 8+
     375x667 8s
     320x568 SE
     320x480 4s iOS9.x
     */
    static var width = UIScreen.main.bounds.size.width
    static var height = UIScreen.main.bounds.size.height
    static var iPhone4: Bool { return UIScreen.height <= 480 }
    static var underSE: Bool { return UIScreen.width < 375 }
    static var overIPhone8: Bool { return UIScreen.width >= 375 }
    static var iPhone8: Bool { return UIScreen.width == 375 }
    static var iPhone8Plus: Bool { return UIScreen.width == 414 }
    static var iphoneX: Bool { return UIScreen.main.nativeBounds.height == 2436 }
}
