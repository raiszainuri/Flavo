//
//  Food.swift
//  myFirstApp
//
//  Created by ais on 26/03/25.
//

import Foundation

struct FoodData: Identifiable {
    let id: UUID = UUID()
    let name: String
    let price: Int
    let image: String
    let tags: [String]
}
