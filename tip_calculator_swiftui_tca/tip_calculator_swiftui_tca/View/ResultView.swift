//
//  ResultView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/08/31.
//

import SwiftUI
import ComposableArchitecture

struct ResultView: View {
    let store: StoreOf<Calculator>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: 20) {
                Text("Total p/person")
                    .font(ThemeFont.demibold(ofSize: 18))
                CurrencyView(currencyViewType: .amount,
                             store: store)
                CustomDivider(color: ThemeColor.separator, height: 2)
                HStack {
                    AmountView(viewType: .bill,
                               title: "Total bill",
                               store: store)
                    Spacer()
                    AmountView(viewType: .tip,
                               title: "Total tip",
                               store: store)
                }
            }
            .padding(EdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24))
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .black.opacity(0.1), radius: 12, x: 0, y: 3)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(
            store: Store(initialState: Calculator.State(),
                         reducer: { Calculator() }
                        )
        )
    }
}
