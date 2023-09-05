//
//  BillInputView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/08/31.
//

import SwiftUI
import ComposableArchitecture

struct BillInputView: View {
    let store: StoreOf<Calculator>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack(spacing: 24) {
                HeaderView(topText: "Enter", bottomText: "your bill")
                HStack {
                    Text("$")
                        .font(ThemeFont.bold(ofSize: 24))
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    TextField("",
                              text: viewStore.binding(get: \.bill.currencyFormatted,
                                                      send: Calculator.Action.inputBill))
                        .font(ThemeFont.demibold(ofSize: 28))
                        .keyboardType(.numberPad)
                }
                .frame(height: 68)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
    }
}

struct BillInputView_Previews: PreviewProvider {
    static var previews: some View {
        BillInputView(
            store: Store(initialState: Calculator.State(),
                         reducer: { Calculator() }
                        )
        )
    }
}
