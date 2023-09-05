//
//  TipInputView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/08/31.
//

import SwiftUI
import ComposableArchitecture

struct TipInputView: View {
    let store: StoreOf<Calculator>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack(alignment: .top, spacing: 24) {
                HeaderView(topText: "Chose", bottomText: "your tip")
                VStack(spacing: 16) {
                    HStack(spacing: 16) {
                        TipButtonView(defaultTip: .tenPercent, store: store)
                        TipButtonView(defaultTip: .fiftenPercent, store: store)
                        TipButtonView(defaultTip: .twentyPercent, store: store)
                    }
                    CustomTipButtonView(store: store)
                }
            }
        }
    }
}

struct TipInputView_Previews: PreviewProvider {
    static var previews: some View {
        TipInputView(
            store: Store(initialState: Calculator.State(),
                         reducer: { Calculator() }
                        )
        )
    }
}
