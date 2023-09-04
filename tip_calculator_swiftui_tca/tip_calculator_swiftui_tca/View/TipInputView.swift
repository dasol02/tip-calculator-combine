//
//  TipInputView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/08/31.
//

import SwiftUI
import Combine

struct TipInputView: View {
    @Binding var tipInput: Tip
    
    var body: some View {
        HStack(alignment: .top, spacing: 24) {
            HeaderView(topText: "Chose", bottomText: "your tip")
            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    TipButtonView(defaultTip: .tenPercent, tipInput: $tipInput)
                    TipButtonView(defaultTip: .fiftenPercent, tipInput: $tipInput)
                    TipButtonView(defaultTip: .twentyPercent, tipInput: $tipInput)
                }
                CustomTipButtonView(tipInput: $tipInput)
            }
        }
    }
}

struct TipInputView_Previews: PreviewProvider {
    static var previews: some View {
        TipInputView(tipInput: .constant(.none))
    }
}
