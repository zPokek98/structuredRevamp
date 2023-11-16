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
        Button(action: {
            print(sortDatesInWeeks(dates: getDatesFromYear(date: mainDate)))
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        })
        Spacer()
    }
}

#Preview {
    ContentView()
}
