//
//  MyFirstUtil.swift
//  HSSwiftCommon
//
//  Created by yoseop park on 2018. 3. 27..
//

import UIKit

public func delay(_ delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(
        deadline: .now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure
    )
}

public func globalAsync(_ closure: @escaping () -> Void) {
    DispatchQueue.global().async(execute: closure)
}

public func mainAsync(_ closure: @escaping () -> Void) {
    DispatchQueue.main.async(execute: closure)
}
