//
//  MyFirstUtil.swift
//  HSSwiftCommon
//
//  Created by yoseop park on 2018. 3. 27..
//

import UIKit

public class MyFirstUtil: NSObject {
    public func myFirstPods() -> String {
        print("------------------myFirstPods")
        return "Hello World~~~~"
    }
    
    public func mySecondPods() -> String {
        print("------------------mySecondPods")
        return "Hay Man~"
    }
    
    public static func callPrivateString() -> String {
        print("------------------callPrivateString")
        return myprivateFunc()
    }
}

private extension MyFirstUtil {
    static func myprivateFunc() -> String {
        print("------------------myprivateFunc")
        return "Hay Man~"
    }
}
