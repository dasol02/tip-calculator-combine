//
//  ContentView.swift
//  tip_calculator_swiftui_tca
//
//  Created by dasol lee on 2023/08/31.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<Calculator>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: 30) {
                LogoView()
                    .onTapGesture {
                        self.store.send(.resetButtonTapped)
                    }
                ResultView(result: viewStore.result)
                BillInputView(store: store)
                TipInputView(store: store)
                SplitInputView(store: store)
                Spacer()
            }
            .padding(24)
            .background(ThemeColor.bg)
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            store: Store(
                initialState: Calculator.State(),
                reducer: {
                    Calculator()
                })
        )
    }
}
