//
//  AmountView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/08/31.
//

import SwiftUI
import ComposableArchitecture

enum AmountViewType {
    case bill
    case tip
}

struct AmountView: View {
    @State var viewType: AmountViewType
    @State var title: String
    
    let store: StoreOf<Calculator>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(alignment: viewType == .bill ? .leading : .trailing) {
                Text(title)
                CurrencyView(currencyViewType: viewType == .bill ? .bill : .tip,
                             store: store)
            }
        }
    }
}

struct AmountView_Previews: PreviewProvider {
    static var previews: some View {
        AmountView(viewType: .bill,
                   title: "Total Bill",
                   store: Store(initialState: Calculator.State(),
                                reducer: { Calculator() }
                               )
                   )
        
    }
}
