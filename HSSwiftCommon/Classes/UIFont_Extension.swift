//
//  UIFont_Extension.swift
//  SkyPeople
//
//  Created by yoseop park on 2018. 3. 26..
//  Copyright © 2018년 HSOCIETY. All rights reserved.
//

import UIKit

extension UIFont {
    /*
     기본 폰트 정의
     */
    static func nanumBarun(fontSize size: CGFloat) -> UIFont {
        if let font = UIFont(name: "나눔바른고딕OTF", size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
}
