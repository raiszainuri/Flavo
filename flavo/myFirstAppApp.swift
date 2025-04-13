//
//  myFirstAppApp.swift
//  myFirstApp
//
//  Created by ais on 20/03/25.
//

import SwiftUI

@main
struct myFirstAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainView().preferredColorScheme(.dark)
            //FoodView().preferredColorScheme(.dark)
        }
    }
}
