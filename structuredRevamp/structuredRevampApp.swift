//
//  structuredRevampApp.swift
//  structuredRevamp
//
//  Created by Salvo on 14/11/23.
//

import SwiftUI
import SwiftData

@main
struct structuredRevampApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
