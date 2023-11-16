//
//  ContentView.swift
//  structuredRevamp
//
//  Created by Salvo on 14/11/23.
//

import SwiftUI
import PopupView

struct ContentView: View {
    
    @State var mainDate = Date()
    
    var body: some View {
        MainHeaderView(mainDate: $mainDate)
        ScrollingDaysView(mainDate: $mainDate)
            .padding(.top, -15)
        Spacer()
    }
}

#Preview {
    ContentView()
}
