//
//  MenuController.swift
//  MyRestaurant
//
//  Created by alumno on 24/01/23.
//

import Foundation

class MenuController {
    let baseURL = URL(string: "http://localhost:8080/")!
    
    enum MenuControllerError: Error, LocalizedError{
        case categoriesNotFound
        case menuItemsNotFound
        case orderRequestFailed
    }
    
    func fetchCategories() async throws -> [String]{
        let categoriesURL = baseURL.appendingPathComponent("categories")
        let (data, response) = try await URLSession.shared.data(from: categoriesURL)
        
        guard let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode == 200 else {
            throw MenuControllerError.categoriesNotFound
        }
        
        let jsonDecoder = JSONDecoder()
        let categoriesResponse = try jsonDecoder.decode(CategoryResponse.self, from: data)
        
        return categoriesResponse.categories
        
    }
    
    func fetchMenuItems(forCategory categoryName: String) async throws -> [MenuItem] {
        let menuURL = baseURL.appendingPathComponent("menu")
        var components = URLComponents(url: menuURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
        
        let (data, response) = try await URLSession.shared.data(from: components.url!)
        
        guard let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode == 200 else {
            throw MenuControllerError.menuItemsNotFound
        }
        
        let decoder = JSONDecoder()
        let menuResponse = try decoder.decode(MenuResponse.self, from: data)
        
        return menuResponse.items
    }
    
    typealias MinutesToPrepare = Int
    
    func submitOrder(forMenuIds menuIds: [Int]) async throws -> MinutesToPrepare{
        let orderURL = baseURL.appendingPathComponent("order")
        var request = URLRequest(url: orderURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        
        let menuIdsDict = ["menuIds": menuIds]
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(menuIdsDict)
        request.httpBody = jsonData
        
        let(data, response) = try await URLSession.shared.data(from: request.url!)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else{
            throw MenuControllerError.orderRequestFailed
        }
        
        let decoder = JSONDecoder()
        let orderResponse = try decoder.decode(OrderResponse.self, from: data)
        
        return orderResponse.prepTime
        
    }
}
