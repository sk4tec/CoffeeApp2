//
//  CoffeeData.swift
//  CoffeeApp2
//
//  Created by Sunjay Kalsi on 24/06/2024.
//
import Foundation

//struct Thing {
//    let data
//}

struct CoffeeData: Codable, Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let ingredients: [String]
    let image: String

    private enum CodingKeys: String, CodingKey {
        case title
        case description
        case ingredients
        case image
    }
}

struct CoffeeModel: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let ingredients: [String]
    let image: String
    var like: Bool
}
