//
//  TaskListView.swift
//  structuredRevamp
//
//  Created by Salvo on 21/11/23.
//

import SwiftUI
import SwiftData

struct TaskListView: View {
    var body: some View {
        Rectangle()
            .clipShape(
                .rect(
                    topLeadingRadius: 0, bottomLeadingRadius: 20, bottomTrailingRadius: 20, topTrailingRadius: 0
                )
            )
            .foregroundStyle(Color.autoWB)
    }
}

#Preview {
    TaskListView()
}
