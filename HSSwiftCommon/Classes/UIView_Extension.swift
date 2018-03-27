//
//  UIView_Extension.swift
//  SkyPeople
//
//  Created by yoseop park on 2017. 4. 21..
//  Copyright © 2017년 HSOCIETY. All rights reserved.
//

import Foundation

extension UIView {

    func rotate(duration: CFTimeInterval = 1.2) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2.0)
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = Float.infinity
        self.layer.add(rotateAnimation, forKey: nil)
    }

    func stopRotate() {
        self.layer.removeAllAnimations()
    }

    func bounceBounce(_ count: Int = 0) {
        if count >= 3 { return }
        UIView.animate(withDuration: 0.27, animations: {
            self.layer.transform = CATransform3DMakeScale(1.05, 1.05, 1.05)
        }) { _ in
            UIView.animate(withDuration: 0.25, animations: {
                self.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
            }) { _ in
                self.bounceBounce(count + 1)
            }
        }
    }

    // 별점 줄때 플립하기
    func flipAnimation(durationTime: TimeInterval = 0.07) {
        mainAsync {
            // 애니메이션
            UIView.animate(withDuration: durationTime, delay: 0.0, options: UIViewAnimationOptions(), animations: {
                self.transform = CGAffineTransform(scaleX: -1, y: 1)
                if let button = self as? UIButton {
                    button.isSelected = true
                }
            }, completion: { _ in
                UIView.animate(withDuration: durationTime, delay: 0.0, options: .autoreverse, animations: {
                    self.transform = CGAffineTransform.identity
                    if let button = self as? UIButton {
                        button.isSelected = true
                    }
                })
            })

        }
    }

    class func flip(delayTime: Double = 0.05, _ views: UIView...) {
        for view in views {
            delay(delayTime, closure: {
                view.flipAnimation()
            })
        }
    }

    public func roundNoBorderView(radius: CGFloat = 7) {
        self.layer.cornerRadius = radius

        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }

    public func roundBorder(radius: CGFloat = 7, width: CGFloat = 0.5, color: UIColor) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor

        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }

    public func border(width: CGFloat = 0.5, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor

        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }

    public func setShadow(radius: CGFloat, opacity: Float = 1, color: UIColor) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }

    func touchAnimation(scaleValue: CGFloat = 1.07, isBigScale: Bool = false, afterAction: @escaping () -> Void = {}) {
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }

        UIView.animate(withDuration: 0.1, animations: {
            self.layoutIfNeeded()

            if isBigScale {
                self.layer.transform = CATransform3DMakeScale(1.3, 1.3, 1.3)
            } else {
                self.layer.transform = CATransform3DMakeScale(scaleValue, scaleValue, scaleValue)
            }
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.layoutIfNeeded()
                self.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
            }) { _ in
                afterAction()
            }

        }
    }

    func alPhaBounceAnimated() {
        self.alpha = 0.5
        self.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0.8)
        UIView.animate(withDuration: 0.5, animations: {
            self.layoutIfNeeded()
            self.alpha = 1.0
            self.layer.transform = CATransform3DMakeScale(1.02, 1.02, 1.02)
        }) { _ in
            UIView.animate(withDuration: 0.3, animations: {
                self.layoutIfNeeded()
                self.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
            }) { _ in

            }
        }
    }

//    func right90Animation(scaleValue: CGFloat = 1.07, isBigScale: Bool = false, afterAction: @escaping ()->Void = {}) {
//        if #available(iOS 10.0, *) {
//            let generator = UIImpactFeedbackGenerator(style: .light)
//            generator.impactOccurred()
//        }
//        
//        let origin = self.layer.transform
//        UIView.animate(withDuration: 0.1, animations: {
//            self.layoutIfNeeded()
//            self.layer.transform = CATransform3DMakeRotation(.pi / 2, 0, 0, 1)
//
//        }) { _ in
//            UIView.animate(withDuration: 0.1, animations: {
////                self.layoutIfNeeded()
////                self.layer.transform = origin
//            }) { _ in
//                afterAction()
//            }
//            
//        }
//    }
}
