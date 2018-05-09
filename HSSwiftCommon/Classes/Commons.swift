//
//  Commons.swift
//  SkyPeople
//
//  Created by 이동희 on 2016. 10. 7..
//  Copyright © 2017년 HSOCIETY. All rights reserved.
//

import Foundation

public func delay(_ delayTime: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now()+Double(Int64(delayTime * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

public func globalAsync(_ closure: @escaping () -> Void) {
    DispatchQueue.global().async(execute: closure)
}

public func mainAsync(_ closure: @escaping () -> Void) {
    DispatchQueue.main.async(execute: closure)
}

public func showAlert(_ parent: UIViewController, title: String, message: String, buttonTitle: String, okAction: ((UIAlertAction) -> Void)?, cancelTitle: String = "취소", cancelAction: ((UIAlertAction) -> Void)?, showCancelButton: Bool) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction( UIAlertAction(title: buttonTitle, style: UIAlertActionStyle.default, handler: buttonAction) )
    if showCancelButton { alertController.addAction( UIAlertAction(title: cancelTitle, style: UIAlertActionStyle.cancel, handler: cancelButtonAction }
    parent.present(alertController, animated: true, completion: nil)
}

public func showToastAlert(_ parent: UIViewController, title: String, message: String, seconds: Double, okActionAfter: (() -> Void)?) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    parent.present(alertController, animated: true, completion: nil)
    
    delay(seconds, closure: {
        alertController.dismiss(animated: true, completion: actionAfter)
    })
}
