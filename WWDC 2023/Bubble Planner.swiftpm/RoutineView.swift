//
//  RoutineView.swift
//  Bubble Planner
//
//  Created by Luis Fernando Gutierrez on 31/03/23.
//

import SwiftUI

struct RoutineView: View {
    @State private var selectedDate = Date()
    var body: some View {
        VStack{
            HStack {
                Button(action: {
                    selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate)!
                }, label: {
                    Image(systemName: "chevron.left")
                })
                .padding()
                
                Text("\(dayOfWeek(selectedDate)).")
                    .font(.title)
                
                Button(action: {
                    selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate)!
                }, label: {
                    Image(systemName: "chevron.right")
                })
                .padding()
            }
            .font(.largeTitle)
            .padding()
        }
        .padding(.bottom,800)
    }
    
    private func dayOfWeek(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d"
        return dateFormatter.string(from: date)
    }
}

struct RoutineView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineView()
    }
}
