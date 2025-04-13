//
//  FoodDetailView.swift
//  myFirstApp
//
//  Created by ais on 26/03/25.
//

import SwiftUI

struct FoodDetailView: View {
    let foodData: FoodData
    let boothData: BoothData

    var body: some View {

        NavigationStack {
            VStack(alignment: .leading) {
                Image(foodData.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 8)

                Spacer().frame(height: 12)

                Text(foodData.name)
                    .font(.system(size: 28, weight: .heavy, design: .default))
                    .foregroundStyle(Color("colors/colorBroccoli"))

                Spacer().frame(height: 8)

                Text("Rp \(foodData.price)")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundStyle(Color("colors/colorCarrot"))
                Spacer().frame(height: 4)
                NavigationLink(
                    destination: BoothDetailView(boothData: boothData)
                ) {
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundStyle(.primary)
                        Text(boothData.name)
                            .foregroundStyle(.primary)
                    }
                }

                Spacer().frame(height: 16)

                HStack {
                    ForEach(foodData.tags, id: \.self) { tag in
                        Text(tag)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color("colors/colorBroccoli"))
                            .foregroundColor(Color("colors/colorLime"))
                            .clipShape(Capsule())
                    }
                }
                Spacer()
            }.padding()
                .background(Color("colors/colorRice"))
        }
    }
}
#Preview {
    FoodDetailView(
        foodData: FoodData(
            name: "Soto Ayam", price: 25000, image: "soto_ayam",
            tags: ["Soto", "Ayam", "Kuah"]),
        boothData: BoothData(
            name: "Kedai Soto Pak Gembul",
            description: "Soto segar dengan berbagai pilihan lauk.",
            image: "316473_8-6-2021_11-36-25",
            priceRange: "Rp 20.000 - Rp 40.000",
            location: "GOP 9",
            foods: [
                FoodData(
                    name: "Soto Ayam", price: 25000, image: "soto_ayam",
                    tags: ["Soto", "Ayam", "Kuah"]
                )
            ]))
}
