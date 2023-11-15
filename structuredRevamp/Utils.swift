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
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
