//
//  BoothView.swift
//  myFirstApp
//
//  Created by ais on 27/03/25.
//

import SwiftUI

struct BoothView: View {
    @State private var searchText: String = ""
    @StateObject private var viewModel = BoothViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.filteredBooths(with: searchText)) {
                        item in
                        NavigationLink(
                            destination: BoothDetailView(boothData: item)
                        ) {
                            BoothItemView(item: item)
                        }
                    }
                }.padding(.horizontal)
            }
            .navigationTitle("All Booth")
            .background(
                Image("misc/background").resizable().edgesIgnoringSafeArea(
                    .all)
            )
            .searchable(text: $searchText, prompt: "Search booth by name")
        }
    }
}

#Preview {
    BoothView()
}
