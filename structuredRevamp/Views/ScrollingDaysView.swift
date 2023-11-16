//
//  ScrollingDaysView.swift
//  structuredRevamp
//
//  Created by Salvo on 15/11/23.
//

import SwiftUI

struct ScrollingDaysView: View {
    
    @Binding var mainDate: Date
    
    var allDates: [Date] {getDatesFromYear(date: mainDate)}
    var sortedDates: [[Date]] {sortDatesInWeeks(dates: allDates)}
    
    var startCounterDate = 0
    var endCounterDate = 7
    
    var body: some View {
        
        TabView() {
            ForEach(sortedDates, id: \.self) { week in
                HStack {
                    ForEach(week, id: \.self) { day in
                        Button(action: {}, label: {
                            VStack{
                                Text(day.getDayAbbreviation())
                                Text("\(day.getDay())")
                            }
                        })
                        .padding(10)
                    }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 100)
        .padding(-20)
    }
}

#Preview {
    ScrollingDaysView(mainDate: .constant(Date()))
}
