//
//  FridgeView.swift
//  myFirstApp
//
//  Created by ais on 27/03/25.
//

import SwiftUI

struct FridgeView: View {
    @StateObject private var viewModel = BoothViewModel()

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Image("misc/fridge")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 440, height: 896)
                    .offset(y: -14)
                
                NavigationLink(destination: BoothView()) {
                    Text("All Booths")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .opacity(1)
                        .shadow(color: Color.green, radius: 16)
                }
                .offset(x: 20, y: 100)

                NavigationLink(destination: InsideFridgeView()) {
                    Image("misc/fridgeTopHandle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 160)
                        .shadow(color: Color.green, radius: 8)
                }
                .offset(x: -150, y: 100)
                

                NavigationLink(destination: InsideFridgeView()) {
                    Color.red.opacity(0)
                        .frame(height: 60)
                }
                .offset(x: 0, y: 300)

               

                boothNavigationLinks()
//                Text("All Booths")
//                    .frame(width: 88, height: 88)
//                    .scaledToFit()
//                    .background(Color.white.opacity(1))
//                    .rotationEffect(
//                        Angle.degrees(22)
//                    )
//                    .shadow(color: Color.green, radius: 4)
//                    .offset(x: CGFloat(-48 + 2 * 80), y: 160)
               

                NavigationLink(destination: InsideFridgeView()) {
                    Image("misc/fridgeBottomHandle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 300)
                        .shadow(color: Color.green, radius: 8)
                }
                .offset(x: -150, y: 400)

                NavigationLink(destination: FoodView()) {
                    Text("All Foods")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .opacity(1)
                        .shadow(color: Color.green, radius: 16)
                }
                .offset(x: 20, y: 410)
                

                foodNavigationLinks()
            }
        }
    }

    @ViewBuilder
    private func boothNavigationLinks() -> some View {
        ForEach(Array(viewModel.randomBooths.enumerated()), id: \.element.name)
        { index, booth in
            NavigationLink(destination: BoothDetailView(boothData: booth)) {
                Image(booth.image)
                    .resizable()
                    .frame(width: 88, height: 88)
                    .scaledToFit()
                    .background(Color.brown.opacity(0.2))
                    .rotationEffect(
                        Angle.degrees(index == 0 ? 24 : (index == 1 ? -24 : -8))
                    )
                    .shadow(color: Color.green, radius: 4)
            }
            .offset(x: CGFloat(-48 + index * 80), y: 160)
        }
    }

    @ViewBuilder
    private func foodNavigationLinks() -> some View {
        ForEach(Array(viewModel.randomFoods.enumerated()), id: \.element.name)
        { index, booth in
            if let food = booth.foods.randomElement() {
                NavigationLink(
                    destination: FoodDetailView(
                        foodData: food, boothData: booth)
                ) {
                    Image(food.image)
                        .resizable()
                        .frame(width: 88, height: 88)
                        .scaledToFit()
                        .background(Color.brown.opacity(0.2))
                        .rotationEffect(
                            Angle.degrees(
                                index == 0 ? 24 : (index == 1 ? -24 : -8))
                        )
                        .shadow(color: Color.green, radius: 4)
                }
                .offset(x: CGFloat(-48 + index * 80), y: 470)
            }
        }
        ForEach(Array(viewModel.randomFoods.enumerated()), id: \.element.name)
        { index, booth in
            if let food = booth.foods.randomElement() {
                NavigationLink(
                    destination: FoodDetailView(
                        foodData: food, boothData: booth)
                ) {
                    Image(food.image)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .scaledToFit()
                        .background(Color.brown.opacity(0.2))
                        .rotationEffect(
                            Angle.degrees(
                                index == 0 ? 24 : (index == 1 ? -24 : -8))
                        )
                        .shadow(color: Color.green, radius: 4)
                }
                .offset(x: CGFloat(-48 + index * 80), y: 580)
            }
        }
    }
}

#Preview {
    FridgeView()
}
