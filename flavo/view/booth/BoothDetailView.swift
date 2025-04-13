//
//  BoothDetailView.swift
//  myFirstApp
//
//  Created by ais on 27/03/25.
//

import SwiftUI

struct BoothDetailView: View {
    let boothData: BoothData
    var body: some View {
        let foods: [FoodData] = boothData.foods

        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Image(boothData.image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(radius: 8)
                    VStack(alignment: .leading) {
                        Text(boothData.name)
                            .font(.system(size: 28, weight: .heavy, design: .default))
                            .foregroundStyle(Color("colors/colorBroccoli"))
                        Spacer()
                        Text(boothData.priceRange)
                            .font(.system(size: 18,weight: .bold,  design: .default))
                            .foregroundStyle(Color("colors/colorCarrot"))
                        HStack(alignment: .center) {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundStyle(
                                    Color("colors/colorCarrot")
                                )
                            Text(boothData.location)
                                .foregroundStyle(Color("colors/colorCarrot")
                                )
                        }
                        Spacer().frame(height: 16)
                            
                        Text("MENU")
                            .font(.system(size: 18,weight: .bold,  design: .default))
                            .foregroundStyle(Color("colors/colorBroccoli"))
                        LazyVStack {
                            ForEach(foods) { item in
                                NavigationLink(
                                    destination: FoodDetailView(
                                        foodData: item, boothData: boothData)
                                ) {
                                    FoodItemBoothDetailView(foodData: item, boothName: "")
                                }
                            }
                        }

                    }
                }.padding()
            }.background(Color("colors/colorRice").edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    BoothDetailView(
        boothData: BoothData(
            name: "Kedai Soto Pak Gembul",
            description: "Soto segar dengan berbagai pilihan lauk.",
            image: "restaurant",
            priceRange: "Rp 20.000 - Rp 40.000",
            location: "GOP 9",
            foods: [
                FoodData(
                    name: "Soto Ayam", price: 25000, image: "soto_ayam",
                    tags: ["Soto", "Ayam", "Kuah"])
            ]
        )
    )
}
