//
//  MainHeaderView.swift
//  structuredRevamp
//
//  Created by Salvo on 15/11/23.
//

import SwiftUI

struct MainHeaderView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var mainDate: Date
    
    var monthName: String {
        mainDate.getMonthName()
    }
    var day: Int {
        mainDate.getDay()
    }
    var year: String {
        String(mainDate.getYear())
    }
    
    @State var isPresentedDataPicker = false
    
    var body: some View {
        HStack{
            Button(action: {
                mainDate = Date()
            }, label: {
                Text("\(monthName)")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.main)
                Text("\(year)")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.autoWB)
            })
            .padding()
            
            Spacer()
            
            Button(action: {
                isPresentedDataPicker = true
            }, label: {
                Image(systemName: "calendar")
                    .foregroundStyle(.main)
                    .font(.title)
            }).popup(isPresented: $isPresentedDataPicker, view: {
                DataPickerView(selectedData: $mainDate)
            }, customize: {
                $0
                    .type(.toast)
                    .isOpaque(true)
                    .position(.top)
                    .closeOnTap(false)
                    .closeOnTapOutside(true)
                    .dragToDismiss(true)
                    .backgroundColor(colorScheme == .light ? .black.opacity(0.2) : .white.opacity(0.2))
            })
            
            Image(systemName: "gear")
                .foregroundStyle(.main)
                .font(.title)
                .padding(.trailing)
        }
    }
}

#Preview {
    MainHeaderView(mainDate: .constant(Date()))
}
