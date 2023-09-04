//
//  tip_calculator_swiftui_tcaApp.swift
//  tip_calculator_swiftui_tca
//
//  Created by dasol lee on 2023/09/04.
//

import SwiftUI

@main
struct tip_calculator_swiftui_tcaApp: App {
    @StateObject var calculaotrVM = CalculatorVM()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(calculaotrVM)
        }
    }
}
