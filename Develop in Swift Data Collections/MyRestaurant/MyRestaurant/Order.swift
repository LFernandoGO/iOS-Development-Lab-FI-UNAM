//
//  Order.swift
//  MyRestaurant
//
//  Created by alumno on 24/01/23.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []){
        self.menuItems = menuItems
    }
}
