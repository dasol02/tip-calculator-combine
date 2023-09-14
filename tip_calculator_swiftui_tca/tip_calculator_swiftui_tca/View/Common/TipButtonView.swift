//
//  TipButtonView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/09/04.
//

import SwiftUI
import ComposableArchitecture

struct TipButtonView: View {
    var inputTip: Tip
    var defaultTip: Tip
    var action: ((Tip) -> Void)?

    var attributedText: AttributedString {
        var tipValue = AttributedString(defaultTip.stringValue)
        tipValue.font = ThemeFont.bold(ofSize: 20)
        
        var percent = AttributedString("%")
        percent.font = ThemeFont.demibold(ofSize: 14)
        
        return tipValue + percent
    }
    
    var body: some View {
        Button {
            action?(defaultTip)
        } label: {
            Text(attributedText)
                .padding()
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(inputTip == defaultTip ? ThemeColor.secondary : ThemeColor.primary)
        )
    }
}

struct TipButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TipButtonView(inputTip: .none, defaultTip: .none)
    }
}


