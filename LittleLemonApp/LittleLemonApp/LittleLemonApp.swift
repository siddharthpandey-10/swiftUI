//
//  LittleLemonAppApp.swift
//  LittleLemonApp
//
//  Created by Siddharth Pandey on 14/07/25.
//

import SwiftUI

@main
struct LittleLemonApp: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(model)
        }
    }
}

