//
//  ModelData.swift
//  Landmarks
//
//  Created by alumno on 25/01/23.
//

import Foundation

final class ModelData: ObservableObject{
    @Published var landMarks: [Landmark] = load("landmarkData.json")
    
    var categories: [String: [Landmark]]{
        Dictionary(
            grouping: landMarks,
            by: {$0.category.rawValue}
        )
    }
    
    var features: [Landmark]{
        landMarks.filter({$0.isFeatured})
    }
}

var landMarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("File not found \(fileName)")
    }
    
    do{
        data = try Data(contentsOf: file)
    } catch{
        fatalError("Cant load data: \(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch{
        fatalError("Cant decode information as \(T.self):\(error)")
    }
}
