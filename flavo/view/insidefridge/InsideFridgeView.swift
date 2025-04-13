//
//  InsideFridgeView.swift
//  myFirstApp
//
//  Created by ais on 07/04/25.
//
//
//  InsideFridgeView.swift
//  myFirstApp
//
//  Created by ais on 07/04/25.
//

import SwiftUI

struct InsideFridgeView: View {
    let items: [FridgeItem] = [
        FridgeItem(imageName: "insideTheFridgeBeef",     ingredientName: "ingredientsBeef",     tag: "Daging"),
        FridgeItem(imageName: "insideTheFridgeBread",    ingredientName: "ingredientsBread",    tag: "Roti"),
        FridgeItem(imageName: "insideTheFridgeChicken",  ingredientName: "ingredientsChicken",  tag: "Ayam"),
        FridgeItem(imageName: "insideTheFridgeChili",    ingredientName: "ingredientsChili",    tag: "Pedas"),
        FridgeItem(imageName: "insideTheFridgeDessert",  ingredientName: "ingredientsDessert",  tag: "Dessert"),
        FridgeItem(imageName: "insideTheFridgeEgg",      ingredientName: "ingredientsEgg",      tag: "Telur"),
        FridgeItem(imageName: "insideTheFridgeMeatball", ingredientName: "ingredientsMeatball", tag: "Bakso"),
        FridgeItem(imageName: "insideTheFridgeNoodle",   ingredientName: "ingredientsNoodle",   tag: "Mie"),
        FridgeItem(imageName: "insideTheFridgeRedRice",  ingredientName: "ingredientsRedRice",  tag: "Nasi"),
        FridgeItem(imageName: "insideTheFridgeWhiteRice",ingredientName: "ingredientsWhiteRice",tag: "nasi")
    ]
    
    @State private var selectedItems: [FridgeItem] = []
    @State private var selectedTags: [String] = []

    @State private var isGlassTapped: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                // Background
                Image("misc/insideTheFridge")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 450, height: 900)
                    .offset(y: -14)
                
                // Plate
                Image("misc/insideTheFridgePlate")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 440, height: 280)
                    .offset(x: -40, y: 148)
                
                // Glass (with toggle)
                Image("misc/insideTheFridgeGlass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 140)
                    .offset(x: 132, y: 190)
                    .opacity(isGlassTapped ? 1.0 : 0.4)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isGlassTapped.toggle()
                        }
                    }
                
                // First row
                LazyHStack(spacing: 16) {
                    ForEach(items.prefix(3)) { item in
                        FridgeItemView(
                            item: item,
                            isSelected: selectedItems.contains(item),
                            onTap: { toggleSelection(item) }
                        )
                    }
                }
                .offset(y: -25)
                
                // Second row
                LazyHStack(spacing: 16) {
                    ForEach(items[3..<6]) { item in
                        FridgeItemView(
                            item: item,
                            isSelected: selectedItems.contains(item),
                            onTap: { toggleSelection(item) }
                        )
                    }
                }
                .offset(y: 65)
                
                // Third row
                LazyHStack(spacing: 16) {
                    ForEach(items[6..<8]) { item in
                        FridgeItemView(
                            item: item,
                            isSelected: selectedItems.contains(item),
                            onTap: { toggleSelection(item) }
                        )
                    }
                }
                .offset(y: 155)
                
                // Rice row
                LazyHStack(spacing: -16) {
                    ForEach(items.suffix(2)) { item in
                        FridgeItemRiceView(
                            item: item,
                            isSelected: selectedItems.contains(item),
                            onTap: { toggleSelection(item) }
                        )
                    }
                }
                .offset(y: 360)
                
                // Selected items on plate — row 1
                ForEach(Array(selectedItems.prefix(5).enumerated()), id: \.element.id) { index, item in
                    Image("misc/\(item.ingredientName)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 88, height: 88)
                        .offset(
                            x: CGFloat(index * 40) - CGFloat((min(selectedItems.count, 5) - 1) * 20) - 40,
                            y: 200
                        )
                        .transition(.move(edge: .bottom))
                        .onTapGesture {
                            withAnimation {
                                toggleSelection(item)
                            }
                        }
                        .zIndex(1)
                }
                
                NavigationLink(
                    destination: FoodView(
                        tags: selectedTags,
                        isGlassTapped: true
                    ),
                    label: {
                        Text("Next")
                            .padding()
                            .frame(width: 360, height: 50)
                            .background(Color("colors/colorCarrot"))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                        
                    }
                ).padding().offset(y: 768)
                
                // Selected items on plate — row 2
                if selectedItems.count > 5 {
                    ForEach(Array(selectedItems.dropFirst(5).enumerated()), id: \.element.id) { index, item in
                        Image("misc/\(item.ingredientName)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 88, height: 88)
                            .offset(
                                x: CGFloat(index * 40) - CGFloat((selectedItems.count - 6) * 20) - 40,
                                y: 220
                            )
                            .transition(.move(edge: .bottom))
                            .onTapGesture {
                                withAnimation {
                                    toggleSelection(item)
                                }
                            }
                            .zIndex(1)
                    }
                }
            }
            .animation(.easeInOut, value: selectedItems)
        }
    }
    
    private func toggleSelection(_ item: FridgeItem) {
        if let index = selectedItems.firstIndex(of: item) {
            selectedItems.remove(at: index)
            selectedTags.removeAll { $0 == item.tag }
        } else {
            selectedItems.append(item)
            if !selectedTags.contains(item.tag) {
                selectedTags.append(item.tag)
            }
        }
    }

}

#Preview {
    InsideFridgeView()
}
