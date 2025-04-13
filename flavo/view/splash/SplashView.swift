//
//  SplashView.swift
//  myFirstApp
//
//  Created by ais on 08/04/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        NavigationStack {
            Image("misc/splashBackground")
                .resizable()
                .scaledToFill()
                .frame(width: 440, height: 896)
        }
    }
}

#Preview {
    SplashView()
}
