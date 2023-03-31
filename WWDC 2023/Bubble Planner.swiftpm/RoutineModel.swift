//
//  RoutineModel.swift
//  Bubble Planner
//
//  Created by Luis Fernando Gutierrez on 31/03/23.
//

import Foundation

struct Routine: Identifiable {
    let id = UUID()
    var name: String
    var activities: [Activity]
    var dayOfWeek: Int
    var hourOfDay: Int
    
}

struct Activity: Identifiable {
    let id = UUID()
    let name: String
    let duration: Int // en minutos
}
