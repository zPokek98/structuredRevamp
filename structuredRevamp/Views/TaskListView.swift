//
//  TaskListView.swift
//  structuredRevamp
//
//  Created by Salvo on 21/11/23.
//

import SwiftUI
import SwiftData

struct TaskListView: View {
    
    @Query var tasks: [Task]
    @Environment(\.modelContext) var modelContext
    @Binding var mainDate: Date
    
    var body: some View {
        Rectangle()
            .clipShape(
                .rect(
                    topLeadingRadius: 0, bottomLeadingRadius: 20, bottomTrailingRadius: 20, topTrailingRadius: 0
                )
            )
            .foregroundStyle(Color.autoWBOpposite)
            .overlay(content: {
                ScrollView{
                    VStack{
                        ForEach(tasks, id: \.self){ task in
                            if isSameDay(date1: task.date, date2: mainDate){
                                HStack{
                                    VStack(spacing: 0){
                                        Group{
                                            Text("\(task.date.getHour()):\(task.date.getMinute())")
                                            Image(systemName: "arrow.down")
                                                .accessibilityLabel("to")
                                                
                                            Text("\(addMinutesToDate(date:task.date,minutes:task.duration).getHour()):\(addMinutesToDate(date:task.date,minutes:task.duration).getMinute())")
                                        }
                                        .padding(1)
                                        .foregroundStyle(.gray)
                                    }
                                    .padding(5)
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .frame(width: UIScreen.screenWidth/1.5, height: 70)
                                        .foregroundStyle(Color.background)
                                        .overlay(content: {
                                            HStack{
                                                RoundedRectangle(cornerRadius: 25.0)
                                                    .frame(width: 70, height: 70)
                                                    .foregroundStyle(.main)
                                                    .overlay(content: {
                                                        Image(systemName: task.iconName)
                                                            .foregroundStyle(.autoWB)
                                                            .scaleEffect(1.4)
                                                    })
                                                VStack{
                                                    HStack{
                                                        Text(task.taskName)
                                                            .font(.title)
                                                            .foregroundStyle(.autoWB)
                                                        Spacer()
                                                    }
                                                    HStack{
                                                        Text(task.taskDesc)
                                                            .font(.subheadline)
                                                            .foregroundStyle(.autoWB)
                                                        Spacer()
                                                    }
                                                }
                                                Spacer()
                                            }
                                        })
                                        .padding(10)
                                        .shadow(radius: 0)
                                    Button(action: {
                                        modelContext.delete(task)
                                    }, label: {
                                        Image(systemName: "trash.fill")
                                            .foregroundStyle(.red)
                                            .padding(.leading, -5)
                                    })
                                }
                                Spacer()
                            }
                        }
                    }
                    .padding(.top, 15)
                }
            })
    }
}

#Preview {
    TaskListView(mainDate: .constant(Date()))
}
