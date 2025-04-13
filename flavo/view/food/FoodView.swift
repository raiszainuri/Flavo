//
//  FoodList.swift
//  myFirstApp
//
//  Created by ais on 26/03/25.
//

import SwiftUI

struct FoodView: View {
    let tags: [String]
    let isGlassTapped: Bool
    
    init(tags: [String] = [], isGlassTapped: Bool = false) {
        self.tags = tags
        self.isGlassTapped = isGlassTapped
    }
    
    @State private var searchText: String = ""
    @State private var showFilterSheet = false
    @StateObject private var viewModel = BoothViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(
                            viewModel.filteredFoods(with: searchText),
                            id: \.food.id
                        ) { item in
                            NavigationLink(
                                destination: FoodDetailView(
                                    foodData: item.food, boothData: item.booth)
                            ) {
                                FoodItemView(
                                    foodData: item.food,
                                    boothName: item.booth.name)
                            }
                        }
                    }.padding()
                }
            }.navigationTitle("Food List")
                .background(
                    Image("misc/background").resizable().edgesIgnoringSafeArea(
                        .all)
                )
                .searchable(text: $searchText, prompt: "Cari makanan")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showFilterSheet = true
                        }) {
                            Image(
                                systemName: "line.3.horizontal.decrease.circle")
                        }
                    }
                }
                .sheet(isPresented: $showFilterSheet) {
                    FilterSheetView(
                        viewModel: viewModel,
                        onDone: { showFilterSheet = false }
                    )
                }.onAppear {
                    if !tags.isEmpty {
                        viewModel.selectedIncludeTags = Set(tags)
                    }
                }
        }
    }
}

//#Preview {
//    FoodView()
//}
