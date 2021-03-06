//
//  Date_Extension.swift
//  SkyPeople
//
//  Created by yoseop park on 2017. 4. 5..
//  Copyright © 2017년 HSOCIETY. All rights reserved.
//

import Foundation

public enum NowType: String {
    case now1 = "yyyy-MM-dd HH:mm:ss"
    case now2 = "yyyyMMddHHmmss"
    
    var dateFormat: String {
        return self.rawValue
    }
}

extension Date {
    
    public func nowString(nowType: NowType = .now1) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = nowType.dateFormat
        return formatter.string(from: self)
    }
    
    public func offsetFromNow() -> String {
        let y = gapYearsFromNow()
        if y > 0 { return "\(y)년 전" }

        let m = gapMonthsFromNow()
        if m > 0 { return "\(m)개월 전" }

        let w = gapWeeksFromNow()
        if w > 0 { return "\(w)주일 전" }

        let d = gapDaysFromNow()
        if d > 0 { return "\(d)일 전" }

        let h = gapHoursFromNow()
        if h > 0 { return "\(h)시간 전" }

        let min = gapMinutesFromNow()
        if min > 0 { return "\(min)분 전" }

        let sec = gapSecondsFromNow()
//        if sec > 0 { return "\(sec)초 전" }
        if sec > 0 { return "방금 전" }
        return ""
    }

    public func agoTuple(toDate: Date) -> (agoYears: Int, agoMonths: Int, agoDays: Int, agoHours: Int, agoMinutes: Int, agoSeconds: Int) {
        let agoYears: Int = (Calendar.current as NSCalendar).components([.year], from: self, to: toDate, options: []).year ?? 0

        var agoMonths: Int = (Calendar.current as NSCalendar).components([.month], from: self, to: toDate, options: []).month ?? 0
        if agoMonths > 12 { agoMonths = (agoMonths % 12) }

        var agoDays: Int = (Calendar.current as NSCalendar).components([.day], from: self, to: toDate, options: []).day ?? 0
        if agoDays > 365 { agoDays = (agoDays % 365) }

        var agoHours: Int = (Calendar.current as NSCalendar).components([.hour], from: self, to: toDate, options: []).hour ?? 0
        if agoHours > 24 { agoHours = (agoHours % 24) }

        var agoMinutes: Int = (Calendar.current as NSCalendar).components([.minute], from: self, to: toDate, options: []).minute ?? 0
        if agoMinutes > 60 { agoMinutes = (agoMinutes % 60) }

        var agoSeconds: Int = (Calendar.current as NSCalendar).components([.second], from: self, to: toDate, options: []).second ?? 0
        if agoSeconds > 60 { agoSeconds = (agoSeconds % 60) }

        return (agoYears: agoYears, agoMonths: agoMonths, agoDays: agoDays, agoHours: agoHours, agoMinutes: agoMinutes, agoSeconds: agoSeconds)
    }

    public func leftTimeString(toDate: Date) -> String {
        let agos = self.agoTuple(toDate: toDate)
        var leftHours = ""
        var leftMinutes = ""
        if self.day() == toDate.day() {
            if agos.agoHours < 0 || agos.agoMinutes < 0 {
                leftHours = "0"
                leftMinutes = "0"
            } else {
                leftHours = "\(agos.agoHours)"
                leftMinutes = "\(agos.agoMinutes)"
            }
        } else {
            if agos.agoDays > 0 {
                leftHours = "\(agos.agoHours+24)"
                leftMinutes = "\(agos.agoMinutes)"
            } else if agos.agoDays < 0 {
                leftHours = "0"
                leftMinutes = "0"
            } else {
                leftHours = "\(agos.agoHours)"
                leftMinutes = "\(agos.agoMinutes)"
            }
        }
        return "\(leftHours)시간 \(leftMinutes)분"
    }

    public func isEarlierThan(standardDate: Date) -> Bool {
        let isElier = self < standardDate
        return isElier
    }

    public func isEarlierThan(yyyy: Int, mm: Int, dd: Int) -> Bool {
        let flags: NSCalendar.Unit = [.year, .month, .day, .hour, .minute, .second]
        var components = (Calendar.current as NSCalendar).components(flags, from: Date())
        components.year =  yyyy
        components.month = mm
        components.day = dd
        let createdDate = Calendar.current.date(from: components)!
        let isElier = self < createdDate
        return isElier
    }

    public func year() -> Int {
        return Calendar.current.component(.year, from: self)
    }

    public func month() -> Int {
        return Calendar.current.component(.month, from: self)
    }

    public func day() -> Int {
        return Calendar.current.component(.day, from: self)
    }

    public func weekday() -> Int {
        return Calendar.current.component(.weekday, from: self)
    }

    public func hour() -> Int {
        return Calendar.current.component(.hour, from: self)
    }

    public func minute() -> Int {
        return Calendar.current.component(.minute, from: self)
    }

    public func second() -> Int {
        return Calendar.current.component(.second, from: self)
    }

    public func gapYearsFromNow() -> Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year ?? 0
    }

    public func gapMonthsFromNow() -> Int {
        return Calendar.current.dateComponents([.month], from: self, to: Date()).month ?? 0
    }

    public func gapWeeksFromNow() -> Int {
        return Calendar.current.dateComponents([.weekOfYear], from: self, to: Date()).weekOfYear ?? 0
    }

    public func gapDaysFromNow() -> Int {
        return Calendar.current.dateComponents([.day], from: self, to: Date()).day ?? 0
    }

    public func gapHoursFromNow() -> Int {
        return Calendar.current.dateComponents([.hour], from: self, to: Date()).hour ?? 0
    }

    public func gapMinutesFromNow() -> Int {
        return Calendar.current.dateComponents([.minute], from: self, to: Date()).minute ?? 0
    }

    public func gapSecondsFromNow() -> Int {
        return Calendar.current.dateComponents([.second], from: self, to: Date()).second ?? 0
    }
}
