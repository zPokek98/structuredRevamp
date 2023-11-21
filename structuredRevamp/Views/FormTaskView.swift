//
//  FormTaskView.swift
//  structuredRevamp
//
//  Created by Salvo on 20/11/23.
//

import SwiftUI
import SwiftData

enum Priority: String, CaseIterable{
    case high
    case medium
    case low
}

struct FormTaskView: View {
    
    @Binding var mainDate: Date
    @Binding var isShowingFormTaskView: Bool
    @State var taskName = ""
    @State var taskDesc = ""
    @State var notes = ""
    let iconList = ["car", "trophy", "clock", "paperplane"]
    @State var iconName = "car"
    @State var date: Date = Date()
    let durationList = Array(1...320)
    @State var duration: Int = 15
    @State var priority: Priority = Priority.low
    @State var flagColor: Color = .yellow
    
    var body: some View {
        
        
        NavigationStack {
            Form (){
                
                Section("Task"){
                    TextField("* Task name", text: $taskName)
                        .foregroundStyle(.blue)
                    TextField("* Task description", text: $taskDesc)
                    TextField("Notes", text: $notes)
                }

                Section("Time"){
                    HStack{
                        Image(systemName: "calendar")
                            .scaleEffect(1.3)
                            .padding(.leading, 3)
                        DatePicker("Date", selection: $date)
                            .padding(.leading, 11)
                    }
                    HStack{
                        Image(systemName: "clock")
                            .scaleEffect(1.3)
                            .padding(.leading, 3)
                            .foregroundStyle(.yellow)
                        Text("Duration")
                            .foregroundStyle(.autoWB)
                            .padding(.leading, 12)
                        Picker("Duration", systemImage: "clock", selection: $duration){
                            ForEach(durationList, id: \.self){ dur in
                                Text("\(dur) min")
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(height: 100)
                    }
                }
                
                Section("Details"){
                    
                    Picker("Icon", systemImage: iconName, selection: $iconName){
                        ForEach(iconList, id: \.self){ icon in
                            HStack{
                                Image(systemName: icon)
                                    .foregroundStyle(.autoWB)
                                Text(icon.capitalized)
                            }
                        }
                    }
                    .foregroundStyle(.autoWB)
                    HStack{
                        Image(systemName: "flag.fill")
                            .scaleEffect(1.3)
                            .padding(.leading, 3)
                            .foregroundStyle(flagColor)
                        Picker("Priority", selection: $priority){
                            ForEach(Priority.allCases, id: \.self){ prio in
                                Text(prio.rawValue.capitalized)
                            }
                        }
                        .foregroundStyle(.autoWB)
                        .padding(.leading, 13)
                        .onChange(of: priority, {
                            if priority == .low{
                                flagColor = .yellow
                            }else if priority == .medium{
                                flagColor = .orange
                            }else{
                                flagColor = .red
                            }
                        })
                    }

                }
                
            }
            .navigationTitle("Create Task")
            .toolbar(){
                HStack{
                    Button(action: {
                        isShowingFormTaskView = false
                    }, label: {
                        Text("Cancel")
                    })
                }
            }
        }
    }
}

#Preview {
    FormTaskView(mainDate: .constant(Date()), isShowingFormTaskView: .constant(false))
}
