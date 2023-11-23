//
//  Task.swift
//  structuredRevamp
//
//  Created by Salvo on 21/11/23.
//

import Foundation
import SwiftData

@Model
class Task: Hashable{
    var id: UUID = UUID()
    var taskName: String
    var taskDesc: String
    var notes: String
    var iconName: String
    var date: Date
    var duration: Int
    
    init(taskName: String, taskDesc: String, notes: String, iconName: String, date: Date, duration: Int) {
        self.taskName = taskName
        self.taskDesc = taskDesc
        self.notes = notes
        self.iconName = iconName
        self.date = date
        self.duration = duration
    }
}
