//
//  MainView.swift
//  myFirstApp
//
//  Created by ais on 08/04/25.
//

import SwiftUI

struct MainView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            FridgeView()
        } else {
            SplashView()
                .ignoresSafeArea()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
        }
    }
}

#Preview {
    MainView()
}
