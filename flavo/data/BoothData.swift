//
//  BoothData.swift
//  myFirstApp
//
//  Created by ais on 26/03/25.
//

import Foundation

struct BoothData: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let image: String
    let priceRange: String
    let location: String
    let foods: [FoodData]
}
