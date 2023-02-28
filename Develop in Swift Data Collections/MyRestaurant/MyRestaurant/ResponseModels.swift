//
//  ResponseModels.swift
//  MyRestaurant
//
//  Created by alumno on 24/01/23.
//

import Foundation

struct MenuResponse: Codable {
    let items: [MenuItem]
}

struct CategoryResponse: Codable {
    let categories: [String]
}

struct OrderResponse: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey{
        case prepTime = "preparation_time"
    }
}
