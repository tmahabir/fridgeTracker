//
//  fridgeTrackerApp.swift
//  fridgeTracker
//
//  Created by Tenzin Mahabir on 2021-08-04.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}

