//
//  ContentView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/08/31.
//

import SwiftUI
import Combine

struct ContentView: View {
    @EnvironmentObject var calculaotrVM: CalculatorVM
    
    var body: some View {
        VStack(spacing: 30) {
            LogoView()
            ResultView(result: $calculaotrVM.result)
            BillInputView(billInput: $calculaotrVM.bill)
            TipInputView(tipInput: $calculaotrVM.tip)
            SplitInputView(splitInput: $calculaotrVM.split)
            Spacer()
        }
        .padding(24)
        .background(ThemeColor.bg)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CalculatorVM())
    }
}
