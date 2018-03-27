//
//  UIScrollView_Extension.swift
//  SkyPeople
//
//  Created by yoseop park on 2017. 3. 24..
//  Copyright © 2017년 HSOCIETY. All rights reserved.
//

import Foundation

extension UIScrollView {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
}
