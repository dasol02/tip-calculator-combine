//
//  CurrencyView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/09/01.
//

import SwiftUI
import ComposableArchitecture

enum CurrencyViewType {
    case amount
    case bill
    case tip
    
    var currencySize: CGFloat {
        switch self {
        case .amount: return 24
        case .bill, .tip: return 16
        }
    }
    
    var amountSize: CGFloat {
        switch self {
        case .amount: return 40
        case .bill, .tip: return 24
        }
    }
    
    var fontColor: Color {
        switch self {
        case .amount: return Color.black
        case .bill, .tip: return ThemeColor.primary
        }
    }
}

struct CurrencyView: View {
    var currencyViewType: CurrencyViewType
    var result: Result
    
    var body: some View {
            HStack(alignment: .bottom, spacing: 0) {
                Text("$")
                    .font(ThemeFont.bold(ofSize: currencyViewType.currencySize))
                    .foregroundColor(currencyViewType.fontColor)
                Text(currencyViewType == .bill ? result.totalBill :
                        currencyViewType == .tip ? result.totalTip : result.amountPerPerson)
                    .font(ThemeFont.bold(ofSize: currencyViewType.amountSize))
                    .foregroundColor(currencyViewType.fontColor)
                    .padding(EdgeInsets(.init(top: 0, leading: 0, bottom: -5, trailing: 0)))
            }
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView(currencyViewType: .amount, result: Result(amountPerPerson: "0", totalBill: "0", totalTip: "0"))
    }
}
