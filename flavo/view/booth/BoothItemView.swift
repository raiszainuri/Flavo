//
//  BoothItemView.swift
//  myFirstApp
//
//  Created by ais on 27/03/25.
//

import SwiftUI

struct BoothItemView: View {
    let item: BoothData
    var body: some View {
        HStack(spacing: 16) {
            Image(item.image)
                .resizable()
                .scaledToFill()
                .frame(width: 88, height: 88)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 2)
            
            VStack(alignment: .leading, spacing: 4){
                Text(item.name)
                    .frame(alignment: .leading)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundStyle(Color.white)
                
                Text(item.priceRange)
                    .font(.subheadline)
                    .foregroundStyle(Color.white)
                
                HStack(spacing: 4) {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundStyle(Color.white)
                    Text(item.location)
                        .font(.caption)
                        .foregroundStyle(Color.white)
                }
            }
            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 4)
    }
}

#Preview {
    BoothItemView(
        item: BoothData(
            name: "Kedai Soto Pak Gembul",
            description: "Soto segar dengan berbagai pilihan lauk.",
            image: "booths/kasturi",
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
