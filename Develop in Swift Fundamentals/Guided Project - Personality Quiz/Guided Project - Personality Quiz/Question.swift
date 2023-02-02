//
//  Question.swift
//  Guided Project - Personality Quiz
//
//  Created by alumno on 02/02/23.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers:  [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
}

