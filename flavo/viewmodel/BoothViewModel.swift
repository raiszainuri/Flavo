//
//  BoothViewModel.swift
//  myFirstApp
//
//  Created by ais on 07/04/25.
//

import SwiftUI

class BoothViewModel: ObservableObject {
    @Published var booths: [BoothData] = BoothDataSeeder.seed()
    @Published var selectedIncludeTags: Set<String> = []
    @Published var selectedExcludeTags: Set<String> = []

    var allFoodsWithBooths: [(food: FoodData, booth: BoothData)] {
        booths.flatMap { booth in
            booth.foods.map { food in (food, booth) }
        }
    }

    var randomBooths: [BoothData] {
        booths.shuffled().prefix(3).map { $0 }
    }

    var randomFoods: [BoothData] {
        booths.shuffled().prefix(3).map { $0 }
    }

    func filteredBooths(with query: String) -> [BoothData] {
        if query.isEmpty {
            return booths
        } else {
            return booths.filter {
                $0.name.lowercased().contains(query.lowercased())
            }
        }
    }
    
    func getAllTags() -> [String] {
        let tags = booths.flatMap { $0.foods.flatMap { $0.tags } }
        return Array(Set(tags)).sorted()
    }

    func filteredFoods(with searchText: String, tags: [String] = []) -> [(
        food: FoodData, booth: BoothData
    )] {
        let lowercasedQuery = searchText.lowercased()

        return allFoodsWithBooths.filter { item in
            let matchesSearch =
                lowercasedQuery.isEmpty
                || item.food.name.lowercased().contains(lowercasedQuery)
                || item.booth.name.lowercased().contains(lowercasedQuery)

            let matchesInclude =
                selectedIncludeTags.isEmpty
                || !selectedIncludeTags.isDisjoint(with: item.food.tags)

            let matchesExclude =
                selectedExcludeTags.isDisjoint(with: item.food.tags)

            if tags.isEmpty {
                return matchesSearch && matchesInclude && matchesExclude
            } else {
                let tagSet = Set(tags)
                let matchesFridgeTags =
        tagSet.isEmpty
                ||
                    !tagSet.isDisjoint(with: item.food.tags)
                return matchesSearch && matchesInclude && matchesFridgeTags
            }

        }
    }

}
