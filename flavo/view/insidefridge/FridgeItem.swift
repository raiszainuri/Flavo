//
//  FridgeItem.swift
//  myFirstApp
//
//  Created by ais on 09/04/25.
//


import Foundation

struct FridgeItem: Identifiable, Equatable {
    let id = UUID()
    let imageName: String
    let ingredientName: String
    let tag: String
}
