//
//  tip_calculator_swiftUIApp.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/08/31.
//

import SwiftUI

@main
struct tip_calculator_swiftUIApp: App {
    @StateObject var calculaotrVM = CalculatorVM()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(calculaotrVM)
        }
    }
}
