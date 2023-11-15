//
//  DataPickerView.swift
//  structuredRevamp
//
//  Created by Salvo on 15/11/23.
//

import SwiftUI

struct DataPickerView: View {
    
    @Binding var selectedData: Date
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/4)
                .foregroundStyle(.autoWBOpposite)
                .shadow(radius: 20)
    
            Text("Seleziona una data")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.bottom, 20)
            
            DatePicker("", selection: $selectedData, displayedComponents: .date)
                .offset(x:-UIScreen.screenWidth/3, y:UIScreen.screenHeight/30)
                .scaleEffect(1.5)
        }
    }
}

#Preview {
    DataPickerView(selectedData: .constant(Date()))
}
