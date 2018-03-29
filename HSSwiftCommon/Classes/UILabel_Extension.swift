//
//  UILabel_Extension.swift
//  SkyPeople
//
//  Created by yoseop park on 2017. 4. 21..
//  Copyright © 2017년 HSOCIETY. All rights reserved.
//

import Foundation

extension UILabel {

    public func setUnderLine(color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        let lineHeight: CGFloat = 1.0
        border.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width: self.frame.size.width, height: lineHeight)
        self.layer.addSublayer(border)
    }

    public func setAttributedStrings(fullText: String, highlightText: String, highlightColor: UIColor) {
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: highlightText)
        attributedString.setAttributes([NSAttributedStringKey.foregroundColor: highlightColor], range: range)
        self.attributedText = attributedString
    }
    /*
     text + color + underline + font 커스텀.
     */
    public func setAttributedStrings(attrList: [(text: String, color: UIColor, underline: Bool, font: UIFont)]) {
        let attributedResult = NSMutableAttributedString()
        for (str, color, containUnderline, font) in attrList {
            if containUnderline {
                let attributedText = NSMutableAttributedString(string: str)
                attributedText.addAttributes(
                    [NSAttributedStringKey.font: font,
                     NSAttributedStringKey.foregroundColor: color,
                     NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue], range: NSRange(location: 0, length: str.length)
                )
                attributedResult.append(attributedText)
            } else {
                let attributedText = NSMutableAttributedString(string: str)
                attributedText.addAttributes(
                    [NSAttributedStringKey.font: font,
                     NSAttributedStringKey.foregroundColor: color], range: NSRange(location: 0, length: str.length)
                )
                attributedResult.append(attributedText)
            }
        }
        self.attributedText = attributedResult
    }

    /*
     text + color + underline 커스텀.
     */
    public func setAttributedStrings(attrList: [(text: String, color: UIColor, underline: Bool)]) {
        let attributedResult = NSMutableAttributedString()
        for (str, color, containUnderline) in attrList {
            let attributedText = NSMutableAttributedString(string: str)
            if containUnderline {
                attributedText.addAttributes(
                    [NSAttributedStringKey.font: self.font,
                     NSAttributedStringKey.foregroundColor: color,
                     NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue,
                     NSAttributedStringKey.underlineColor: color], range: NSRange(location: 0, length: str.length)
                )
                attributedResult.append(attributedText)
            } else {
                attributedText.addAttributes(
                    [NSAttributedStringKey.font: self.font,
                     NSAttributedStringKey.foregroundColor: color], range: NSRange(location: 0, length: str.length)
                )
                attributedResult.append(attributedText)
            }
        }
        self.attributedText = attributedResult
    }

}
