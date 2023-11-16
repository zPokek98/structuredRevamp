//
//  Utils.swift
//  structuredRevamp
//
//  Created by Salvo on 14/11/23.
//

import Foundation
import UIKit

extension Date {
    func getMonthName() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("MMMM")
        return df.string(from: self)
    }
    func getDay() -> Int {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("d")
        return Int(df.string(from: self)) ?? 0
    }
    func getDayAbbreviation() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("EEE")
        return df.string(from: self)
    }
    func getMonth() -> Int {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("MM")
        return Int(df.string(from: self)) ?? 0
    }
    func getYear() -> Int {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("y")
        return Int(df.string(from: self)) ?? 0
    }
    public func distance(to other: Date) -> TimeInterval {
        return other.timeIntervalSinceReferenceDate - self.timeIntervalSinceReferenceDate
    }

    public func advanced(by n: TimeInterval) -> Date {
        return self + n
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

func getDatesFromYear(date: Date) -> [Date]{
    let calendar = Calendar(identifier: .iso8601)
    
    let year = date.getYear()
    let startOfYear = calendar.date(from: DateComponents(year: year, month: 1, day: 1))
    let range = calendar.range(of: .day, in: .year, for: startOfYear!)!
    let datesInYear = range.compactMap {
        calendar.date(byAdding: .day, value: $0 - 1, to: startOfYear!)
    }
    
    return datesInYear
}

func sortDatesInWeeks(dates: [Date]) -> [[Date]]{
    var datesTemp: [Date] = []
    var datesInWeeks: [[Date]] = []
    
    var startDate = 0
    var endDate = 7
    
    for _ in 0..<52 {
        var i = 0
        for j in startDate..<endDate{
            datesTemp.append(dates[j])
            i+=1
        }
        startDate+=7
        endDate+=7
        datesInWeeks.append(datesTemp)
        datesTemp = []
    }
    
    return datesInWeeks
}
