//
//  UIButton_Extension.swift
//  SkyPeople
//
//  Created by yoseop park on 2017. 4. 21..
//  Copyright © 2017년 HSOCIETY. All rights reserved.
//

import Foundation

extension UIButton {

    public func underLine(underLineText: String, underLineColor: UIColor) {

        let attrString = NSAttributedString(string: underLineText, attributes: [
            NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue,
            NSAttributedStringKey.foregroundColor: underLineColor,
            NSAttributedStringKey.underlineColor: underLineColor
            ])
        self.setAttributedTitle(attrString, for: UIControlState())
    }

    public func enableState() {
        self.alpha = 1.0
        self.isEnabled = true
    }

    public func disableState(_ alPha: CGFloat = 0.6) {
        self.alpha = alPha
        self.isEnabled = false
    }
}
