//
//  Notification_Extension.swift
//  SkyPeople
//
//  Created by yoseop park on 2017. 10. 25..
//  Copyright © 2017년 HSOCIETY. All rights reserved.
//

import UIKit

extension NSNotification.Name {
    // 메인 화면 제어
    static let NOTIFICATION_MAIN_RELOAD_HEARTS = NSNotification.Name(rawValue: "RELOAD_HEART")
    static let NOTIFICATION_MAIN_REFRESH_HEARTS = NSNotification.Name(rawValue: "REFRESH_HEART")
    static let NOTIFICATION_MAIN_ABNORMAL = NSNotification.Name(rawValue: "SHOW_ABNORMAL")  //미 승인된 상태의 오늘의 카드 페이지 포커싱해주기.
    static let NOTIFICATION_MAIN_USERSTATE_CHANGED = NSNotification.Name(rawValue: "REFRESH_USER_STATE_CHANGED")
    static let NOTIFICATION_MAIN_LIVEMATCHING_FINISH = NSNotification.Name(rawValue: "SHOW_LiveMATCHING_FINISH")  //라이브매칭 결과 완료시.
    static let NOTIFICATION_MAIN_LIVEMATCHING_TITLE = NSNotification.Name(rawValue: "SHOW_LiveMATCHING_TITLE_CHANGED")  //라이브매칭 결과 완료시.
    static let NOTIFICATION_MAIN_LiveMATCHING_RED_HOT = NSNotification.Name(rawValue: "SHOW_LiveMATCHING_RED_HOT")  //라이브매칭 빨간점 체크해주기
    static let NOTIFICATION_MAIN_LOGOUT = NSNotification.Name(rawValue: "MAIN_LOGOUT_WHEN_NETWORK_ERROR")  //네트워크 에러시 로그아웃처리.

    // 오늘의카드, 이전카드 스크롤탑!
    static let NOTIFICATION_MOVE_SCROLL_TOP = NSNotification.Name(rawValue: "MOVE_SCROLL_TOP")

    // 추가카드
    static let NOTIFICATION_NEEDS_TODAYS_REFRESH = NSNotification.Name(rawValue: "REFRESH_TODAYS")
    static let NOTIFICATION_REOPEN_MORECARD = NSNotification.Name(rawValue: "REOPEN_MORECARD")

    // 로그아웃
    static let NOTIFICATION_LOGOUT = NSNotification.Name(rawValue: "LOGOUT")

}
