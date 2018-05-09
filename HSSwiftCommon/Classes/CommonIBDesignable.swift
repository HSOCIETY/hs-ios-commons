//
//  ViewIBDesignable.swift
//  SkyPeople
//
//  Created by yoseop park on 2018. 3. 9..
//  Copyright © 2018년 HSOCIETY. All rights reserved.
//

import Foundation

@IBDesignable
public class RoundView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0
    
    override public func draw(_ rect: CGRect) {
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
        super.draw(rect)
    }
}

@IBDesignable
public class RoundButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0
    
    override public func draw(_ rect: CGRect) {
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
        
        super.draw(rect)
    }
}

@IBDesignable
public class RoundLabel: UILabel {
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0
    
    override public func draw(_ rect: CGRect) {
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
        
        super.draw(rect)
    }
}

@IBDesignable
public class RoundImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 0

    override public func draw(_ rect: CGRect) {
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = cornerRadius

        super.draw(rect)
    }
}

@IBDesignable
public class RoundWebView: UIWebView {
    @IBInspectable var cornerRadius: CGFloat = 0

    override public func draw(_ rect: CGRect) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius

        super.draw(rect)
    }
}

public class RoundTextField: UITextField {
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0
    
    override public func draw(_ rect: CGRect) {
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
        
        super.draw(rect)
    }
}

@IBDesignable
public class DotLineView: UIView {
    override public func draw(_ rect: CGRect) {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        let p0 = CGPoint(x: self.bounds.minX, y: self.bounds.minY)
        context.move(to: CGPoint(x: p0.x, y: p0.y))
        let p1 = CGPoint(x: self.bounds.maxX, y: self.bounds.minY)
        context.addLine(to: CGPoint(x: p1.x, y: p1.y))
        context.setLineDash(phase: 0, lengths: [2, 2])

        context.setLineWidth(5)
        context.setLineCap(.butt)
        UIColor.white.set()
        context.strokePath()
    }
}
