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

    public func colorString(text: String, coloredText: String, color: UIColor) {

        let attributedString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: coloredText)
        attributedString.setAttributes([NSAttributedStringKey.foregroundColor: color], range: range)
        self.attributedText = attributedString
    }

    public func setAttributedStrings(textAndColorAttrList: [(text: String, color: UIColor)], isAlignCenter: Bool = false) {
        let attributedResult = NSMutableAttributedString()
        for (str, color) in textAndColorAttrList {
            let attributedText = NSMutableAttributedString(string: str)
            if isAlignCenter {
                let paraStyle = NSMutableParagraphStyle()
                paraStyle.alignment = .center
                attributedText.addAttributes(
                    [NSAttributedStringKey.font: self.font, NSAttributedStringKey.paragraphStyle: paraStyle, NSAttributedStringKey.foregroundColor: color], range: NSRange(location: 0, length: str.length)
                )
            } else {
                attributedText.addAttributes(
                    [NSAttributedStringKey.font: self.font, NSAttributedStringKey.foregroundColor: color], range: NSRange(location: 0, length: str.length)
                )
            }

            attributedResult.append(attributedText)
        }
        self.attributedText = attributedResult
    }

//    public func setAttributedStrings(attrList: [(text: String, color: UIColor, fontSize: Int)]) {
//        let attributedResult = NSMutableAttributedString()
//        for (str, color, fontSize) in attrList {
//            let attributedText = NSMutableAttributedString(string: str)
//            attributedText.addAttributes(
//                [NSAttributedStringKey.font: NANUM_BARUN_FONT(fontSize: CGFloat(fontSize)), NSAttributedStringKey.foregroundColor: color], range: NSRange(location: 0, length: str.length)
//            )
//            attributedResult.append(attributedText)
//        }
//        self.attributedText = attributedResult
//    }

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
