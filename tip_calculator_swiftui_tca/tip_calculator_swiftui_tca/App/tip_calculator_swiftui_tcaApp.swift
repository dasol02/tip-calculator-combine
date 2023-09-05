//
//  tip_calculator_swiftui_tcaApp.swift
//  tip_calculator_swiftui_tca
//
//  Created by dasol lee on 2023/09/04.
//

import SwiftUI
import ComposableArchitecture

@main
struct tip_calculator_swiftui_tcaApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(
                    initialState: Calculator.State(),
                    reducer: {
                        Calculator()
                    }) )
        }
    }
}
