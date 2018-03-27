//
//  Utils.swift
//  HSSwiftCommon
//
//  Created by yoseop park on 2018. 3. 26..
//

import UIKit

public class MyUtils: NSObject {

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

private extension MyUtils {
    static func myprivateFunc() -> String {
        print("------------------myprivateFunc")
        return "Hay Man~"
    }
}

