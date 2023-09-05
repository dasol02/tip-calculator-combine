//
//  TipButtonView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/09/04.
//

import SwiftUI
import ComposableArchitecture

struct TipButtonView: View {
    @State var defaultTip: Tip
    @State private var openAlert: Bool = false
    
    let store: StoreOf<Calculator>

    var attributedText: AttributedString {
        var tipValue = AttributedString(defaultTip.stringValue)
        tipValue.font = ThemeFont.bold(ofSize: 20)
        
        var percent = AttributedString("%")
        percent.font = ThemeFont.demibold(ofSize: 14)
        
        return tipValue + percent
    }
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Button {
                print(defaultTip.stringValue)
                self.store.send(.updateTipButtonTapped(defaultTip))
            } label: {
                Text(attributedText)
                    .padding()
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(viewStore.tip == defaultTip ? ThemeColor.secondary : ThemeColor.primary)
            ).onTapGesture {
                print("asdsds")
            }
        }
    }
}

struct TipButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TipButtonView(defaultTip: .none,
                      store: Store(initialState: Calculator.State(),
                                   reducer: { Calculator() }
                                  )
        )
    }
}


