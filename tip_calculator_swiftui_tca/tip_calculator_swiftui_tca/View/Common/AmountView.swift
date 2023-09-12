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
    var viewType: AmountViewType
    var title: String
    var result: Result
    
    var body: some View {
        VStack(alignment: viewType == .bill ? .leading : .trailing) {
            Text(title)
            CurrencyView(currencyViewType: viewType == .bill ? .bill : .tip,
                         result: result)
        }
    }
}

struct AmountView_Previews: PreviewProvider {
    static var previews: some View {
        AmountView(viewType: .bill,
                   title: "Total Bill",
                   result: Result(amountPerPerson: "0", totalBill: "0", totalTip: "0")
        )
        
    }
}
