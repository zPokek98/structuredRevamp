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
    
    var mainWeekNumber: Int {
        getSelectedWeekNumber(sortedDate:
                                sortDatesInWeeks(dates:
                                                    getDatesFromYear(date:Date())), date: mainDate) }
    
    var startCounterDate = 0
    var endCounterDate = 7
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader{ proxy in
                HStack(spacing: 0){
                    ForEach(sortedDates, id: \.self) { week in
                        HStack() {
                            ForEach(week, id: \.self) { day in
                                Button(action: {}, label: {
                                    VStack{
                                        Text(day.getDayAbbreviation())
                                            .padding(.bottom, 10)
                                            .font(.subheadline)
                                        Text("\(day.getDay())")
                                    }
                                })
                                .padding(10)
                            }
                        }
                        .frame(width: UIScreen.screenWidth)
                    }
                }
                .onChange(of: mainDate, {
                    proxy.scrollTo(sortedDates[mainWeekNumber])
                })
            }
        }
        .scrollTargetBehavior(.paging)
        /*
        TabView() {
            ForEach(sortedDates, id: \.self) { week in
                HStack {
                    ForEach(week, id: \.self) { day in
                        Button(action: {}, label: {
                            VStack{
                                Text(day.getDayAbbreviation())
                                    .padding(.bottom, 10)
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
         */
    }
}

#Preview {
    ScrollingDaysView(mainDate: .constant(Date()))
}
