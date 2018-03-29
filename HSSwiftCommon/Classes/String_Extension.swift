//
//  String_Extension.swift
//  SkyPeople
//
//  Created by yoseop park on 2017. 4. 5..
//  Copyright © 2017년 HSOCIETY. All rights reserved.
//

import Foundation

extension String {

    public var length: Int { return self.count }
    public var trimmed: String { return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) }
    public func stringFromStartToIndex(_ index: Int) -> String {
        if index > self.length { return self }
        return (self as NSString).substring(to: index)
    }

    public func toAttrString(font: UIFont, lineSpacing: CGFloat) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        let contentsString = self
        let attrString = NSMutableAttributedString(string: contentsString)

        attrString.addAttributes([ NSAttributedStringKey.paragraphStyle: paragraphStyle, NSAttributedStringKey.font: font], range: NSRange(location: 0, length: attrString.length))
        return attrString
    }

    public func calculateHeight(labelWidth: CGFloat, font: UIFont) -> CGFloat {
        let maxLabelSize: CGSize = CGSize(width: labelWidth, height: CGFloat(9999))
        let contentNSString = self as NSString
        let expectedLabelSize = contentNSString.boundingRect(with: maxLabelSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:
            font], context: nil)
        return expectedLabelSize.size.height
    }

    public func calculateHeight(labelWidth: CGFloat, font: UIFont, lineSpacing: CGFloat) -> CGFloat {
        let maxLabelSize: CGSize = CGSize(width: labelWidth, height: CGFloat(9999))
        let contentNSString = self as NSString
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        let expectedLabelSize = contentNSString.boundingRect(with: maxLabelSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [ NSAttributedStringKey.paragraphStyle: paragraphStyle, NSAttributedStringKey.font: font], context: nil)
        return expectedLabelSize.size.height
    }

    /*
     쿠폰 포멧 '영문2자리' + '숫자3자리' + '영문4자리'
     ex>AB690FWVM
     */
    public func getValidCoupon() -> String? {
        do {
            let regex = try NSRegularExpression(pattern: "[a-z|A-Z]{2}\\d{3}[|a-z|A-Z]{4}", options: [])
            let results = regex.matches(in: self, range: NSRange(location: 0, length: self.length))
            if results.count > 0 {
                if let result = results.first, result.range.location != NSNotFound {
                    return self[result.range]
                }
            }
            return nil
        } catch {
            return nil
        }
    }

    public subscript(aRange: NSRange) -> String {
        let start = index(startIndex, offsetBy: aRange.location)
        let end = index(start, offsetBy: aRange.length)
        return String(self[start..<end])
    }

    /*
     세자리수 단위로 컴마가 추가됨
     ex) 11000 -> 11,000
     */
    public static func convertStyle(intValue value: Int) -> String {
        if value < 100 { return String(value) }
        let largeNumber = NSNumber(value: value as Int)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        let commaString = numberFormatter.string(from: largeNumber)!
        return commaString
    }

    public func checkEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let email = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return email.evaluate(with: self)
    }
}
