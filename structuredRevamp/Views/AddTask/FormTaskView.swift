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
    @Environment(\.modelContext) var modelContext
    @State var isShowingAlert: Bool = false
    
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
                    .padding(.trailing, 250)
                    Spacer()
                    Button(action: {
                        if !self.taskName.isEmpty
                            && !self.taskDesc.isEmpty{
                            modelContext.insert(Task(taskName: self.taskName, taskDesc: self.taskDesc, notes: self.notes, iconName: self.iconName, date: self.date, duration: self.duration))
                            isShowingFormTaskView = false
                        }else{
                            isShowingAlert = true
                        }
                    }, label: {
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 50, height: 35)
                            .scaledToFit()
                            .overlay(content: {
                                Text("Add")
                                    .foregroundStyle(.autoWBOpposite)
                            })
                        
                    })
                    .alert(isPresented: $isShowingAlert) {
                        Alert(title: Text("Attention!"), message: Text("The task name and the task description are necessary"), dismissButton: .default(Text("Got it!")))
                    }
                    .padding(.trailing, 10)
                }
            }
        }
    }
}

#Preview {
    FormTaskView(mainDate: .constant(Date()), isShowingFormTaskView: .constant(false))
}
