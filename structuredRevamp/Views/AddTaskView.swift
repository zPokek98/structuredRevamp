//
//  AddTaskView.swift
//  structuredRevamp
//
//  Created by Salvo on 20/11/23.
//

import SwiftUI

struct AddTaskView: View {
    
    @State var isShowingFormTaskView: Bool = false
    @Binding var mainDate: Date
    
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
                isShowingFormTaskView = true
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.main)
            })
            .padding(.bottom, 70)
            .padding(.trailing, 20)
            .sheet(isPresented: $isShowingFormTaskView, content: {
                FormTaskView(mainDate: $mainDate, isShowingFormTaskView: $isShowingFormTaskView)
                    .presentationDetents([.large])
            })
        }
    }
}

#Preview {
    AddTaskView(mainDate: .constant(Date()))
}
