//
//  ContentView.swift
//  structuredRevamp
//
//  Created by Salvo on 14/11/23.
//

import SwiftUI
import PopupView
import SwiftData

struct ContentView: View {
    
    @State var mainDate: Date = Date()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
                .foregroundStyle(Color.background)
            
            VStack{
                MainHeaderView(mainDate: $mainDate)
                
                ScrollingDaysView(mainDate: $mainDate)
                    .padding(.top, -20)
                
                Spacer()
                    .foregroundStyle(Color(hue: 0.538, saturation: 0.205, brightness: 1.0))
                
                ZStack{
                    TaskListView(mainDate: $mainDate)
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/1.35)
                        .shadow(radius: 10)
                    VStack{
                        Spacer()
                        AddTaskView(mainDate: $mainDate)
                    }
                }
            }
            .padding(.top, 40)
        }
    }
}

#Preview {
    ContentView()
}
