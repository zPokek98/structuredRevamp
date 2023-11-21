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
    
    @State var hapticFeedback = true
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader{ proxy in
                HStack(spacing: 0){
                    ForEach(sortedDates, id: \.self) { week in
                        HStack() {
                            ForEach(week, id: \.self) { day in
                                Button(action: {
                                    mainDate = day
                                    hapticFeedback.toggle()
                                }, label: {
                                    if isSameDay(date1: mainDate, date2: day){
                                        VStack{
                                            Text(day.getDayAbbreviation())
                                                .font(.footnote)
                                                .foregroundStyle(.main)
                                                .padding(.bottom, 10)
                                                .offset(y:6)
                                            Circle()
                                                .overlay(content: {
                                                    Text("\(day.getDay())")
                                                        .foregroundStyle(.autoWB)
                                                        .font(.headline)
                                                        .bold()
                                                })
                                                .frame(width:35)
                                                .foregroundStyle(.main)
                                                .padding(.bottom, 0)
                                        }
                                    }else{
                                        VStack{
                                            Text(day.getDayAbbreviation())
                                                .padding(.bottom, 10)
                                                .font(.footnote)
                                                .foregroundStyle(.gray)
                                            Text("\(day.getDay())")
                                                .foregroundStyle(.autoWB)
                                                .font(.headline)
                                                .bold()
                                        }
                                    }
                                })
                                .sensoryFeedback(.selection, trigger: hapticFeedback)
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
        .onAppear(perform: {
            mainDate = Date()
        })
    }
}

#Preview {
    ScrollingDaysView(mainDate: .constant(Date()))
}
