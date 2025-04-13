//
//  FoodItemView.swift
//  myFirstApp
//
//  Created by ais on 26/03/25.
//

import SwiftUI

struct FoodItemBoothDetailView: View {
    let foodData: FoodData
    let boothName: String
    let padding: CGFloat = 14
    
    var body: some View {
        HStack(spacing: 16) {
            Image(foodData.image)
                .resizable()
                .scaledToFill()
                .frame(width: 88, height: 88)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 2)
            VStack(alignment: .leading, spacing: 4) {
                Text(foodData.name)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .frame( alignment: .leading)
                    .foregroundStyle(Color.white)
                Text("Rp. \(foodData.price)")
                    .font(.subheadline)
                    .foregroundStyle(Color.white)
                if !boothName.isEmpty {
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundStyle(Color.white)
                        Text(boothName)
                            .foregroundStyle(
                                Color.white
                            )
                    }
                }else{
                    HStack {
                        Image(systemName: "checkmark.circle")
                            .foregroundStyle(Color.white)
                        Text("Available")
                            .foregroundStyle(
                                Color.white
                            )
                    }
                }
            }
            Spacer()
        }
        .padding()
        .background(Color("colors/colorBroccoli"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 4)
    }
}

#Preview {
    FoodItemBoothDetailView(
        foodData: FoodData(
            name: "Nama Makanan", price: 10000, image: "food",
            tags: ["", ""]),
        boothName: "Padang Sedap")
}
