//
//  TipInputView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/08/31.
//

import SwiftUI
import ComposableArchitecture

struct TipInputView: View {
    var inputTip: Tip
    var action: ((Tip) -> Void)?
    
    var body: some View {
        HStack(alignment: .top, spacing: 24) {
            HeaderView(topText: "Chose", bottomText: "your tip")
            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    TipButtonView(inputTip: inputTip, defaultTip: .tenPercent, action: action)
                    TipButtonView(inputTip: inputTip, defaultTip: .fiftenPercent, action: action)
                    TipButtonView(inputTip: inputTip, defaultTip: .twentyPercent, action: action)
                }
                CustomTipButtonView(inputTip: inputTip, action: action)
            }
        }
    }
}

struct TipInputView_Previews: PreviewProvider {
    static var previews: some View {
        TipInputView(inputTip: Tip.none)
    }
}
