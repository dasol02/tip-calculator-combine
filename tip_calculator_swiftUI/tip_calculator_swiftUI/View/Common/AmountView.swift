//
//  AmountView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/08/31.
//

import SwiftUI

enum AmountViewType {
    case bill
    case tip
}

struct AmountView: View {
    @State var viewType: AmountViewType
    @State var title: String
    @Binding var result: Result
    
    var body: some View {
        VStack(alignment: viewType == .bill ? .leading : .trailing) {
            Text(title)
            CurrencyView(amount: viewType == .bill ? $result.totalBill : $result.totalTip,
                         currencyViewType: viewType == .bill ? .bill : .tip)
        }
    }
}

struct AmountView_Previews: PreviewProvider {
    static var previews: some View {
        AmountView(viewType: .bill,
                   title: "Total Bill",
                   result: .constant(
                    Result(
                        amountPerPerson: "0",
                        totalBill: "0",
                        totalTip: "0")))
    }
}
