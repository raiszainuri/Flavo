//
//  FridgeItemView.swift
//  myFirstApp
//
//  Created by ais on 09/04/25.
//


import SwiftUI

struct FridgeItemView: View {
    let item: FridgeItem
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Image("misc/\(item.imageName)")
            .resizable()
            .scaledToFit()
            .frame(width: 110, height: 110)
            .opacity(isSelected ? 0.3 : 1.0)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 4)
            .onTapGesture {
                onTap()
            }
    }
}

struct FridgeItemRiceView: View {
    let item: FridgeItem
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Image("misc/\(item.imageName)")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 480)
            .opacity(isSelected ? 0.3 : 1.0)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 4)
            .onTapGesture {
                onTap()
            }
    }
}
