//
//  UIViewController_ex.swift
//  Sky People
//
//  Created by 이동희 on 2016. 10. 28..
//  Copyright © 2017년 HSOCIETY. All rights reserved.
//

import Foundation

// seg관련.
var globalSegueCallBack: ((UIViewController) -> Void)!

// Navigation 관련.
extension UIViewController {

    func navigationToDefault() {
        // bar
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.spMain
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.spWhite]

        // back
        self.navigationController?.navigationBar.tintColor = UIColor.spWhite
        UINavigationBar.appearance().isTranslucent = false
        self.navigationController?.navigationBar.backItem?.title = ""

        let backBtn = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backBtn
    }

    func removeBackTitle() {
        // 처음 진입시 이전 스택의 타이틀 제거( 연결되어서 백버튼까지 가지고 오는 경우를 막아줌? )
        let backBtn = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backBtn
    }

    func clearPresent(_ viewController: UIViewController, animated: Bool = false) {
        viewController.clearPresentOption()
        self.present(viewController, animated: animated, completion: nil)
    }

    fileprivate func clearPresentOption() {
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
    }

    /*
     segueId로 ViewController를 호출해준다.
     반드시 다음을 구현해줘야 한다.
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     self.segueQueue(segue)
     }
     */

    func pushViewController(segueId: String, callBack:@escaping (UIViewController) -> Void) {
        globalSegueCallBack = callBack
        self.performSegue(withIdentifier: segueId, sender: nil)
    }

    // 호출해준쪽으로 ViewController를 리턴해줌.
    func segueQueue(_ segue: UIStoryboardSegue) {
        if globalSegueCallBack != nil {
            globalSegueCallBack(segue.destination)
            //            globalSegueCallBack = nil
        }
    }

    // 이 함수를 호출하기전에, viewdidload에 self.view.alpha = 0.0를 넣어주자.
    func showViewWithAnimation() {
        self.view.layer.transform = CATransform3DMakeScale(1.05, 1.05, 1.05)

        UIView.animate(withDuration: 0.2, animations: {
            mainAsync {
                self.view.layoutIfNeeded()
                self.view.layer.transform = CATransform3DMakeScale(1, 1, 1)
                self.view.alpha = 1.0
            }
        }) { _ in

        }
    }

    func dismissViewWithAnimation(isAphaAnimation: Bool = false, afterAction: @escaping () -> Void = {}) {
        UIView.animate(withDuration: 0.2, animations: {
            if isAphaAnimation {
                // 알파값만 0변경 후 completion
                self.view.alpha = 0.0
            } else {
                // 화면 확대 에니메이션 후 completion
                self.view.layoutIfNeeded()
                self.view.layer.transform = CATransform3DMakeScale(1.05, 1.05, 1.05)
            }
        }) { _ in
            self.dismiss(animated: false, completion: afterAction)

        }
    }

    //
//    func showCustomIndicator(timeoutSec: TimeInterval = 15.0) {
//        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
//            appDelegate.showIndicator(timeoutSec: timeoutSec)
//        }
//    }
//
//    func hideCustomIndicator() {
//        mainAsync {
//            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
//                appDelegate.hideIndicator()
//            }
//        }
//    }
}
