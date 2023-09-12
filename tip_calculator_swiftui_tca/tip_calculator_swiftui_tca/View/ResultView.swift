//
//  ResultView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/08/31.
//

import SwiftUI
import ComposableArchitecture

struct ResultView: View {
    var result: Result
    
    var body: some View {
            VStack(spacing: 20) {
                Text("Total p/person")
                    .font(ThemeFont.demibold(ofSize: 18))
                CurrencyView(currencyViewType: .amount, result: result)
                CustomDivider(color: ThemeColor.separator, height: 2)
                HStack {
                    AmountView(viewType: .bill,
                               title: "Total bill",
                               result: result)
                    Spacer()
                    AmountView(viewType: .tip,
                               title: "Total tip",
                               result: result)
                }
            }
            .padding(EdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24))
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .black.opacity(0.1), radius: 12, x: 0, y: 3)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(result: Result(amountPerPerson: "0", totalBill: "0", totalTip: "0"))
    }
}
