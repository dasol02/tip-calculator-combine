//
//  Calculaotr.swift
//  tip_calculator_swiftui_tca
//
//  Created by dasol lee on 2023/09/04.
//

import ComposableArchitecture

struct Calculator: Reducer {
    struct State: Equatable {
        var bill: Double = 0
        var tip: Tip = .none
        var split: Int = 1
        var result: Result = .init(amountPerPerson: "0", totalBill: "0", totalTip: "0")
        
        mutating func calculation() {
            let totalTip = getTipAmount(bill: bill, tip: tip)
            let totalBill = bill + totalTip
            let amountPerPerson = totalBill / Double(split)
            result = Result(
                amountPerPerson: amountPerPerson.currencyFormatted,
                totalBill: totalBill.currencyFormatted,
                totalTip: totalTip.currencyFormatted)
            print(result)
        }
        
        private func getTipAmount(bill: Double, tip: Tip) -> Double {
            switch tip {
            case .none:
                return 0
            case .tenPercent:
                return bill * 0.1
            case .fiftenPercent:
                return bill * 0.15
            case .twentyPercent:
                return bill * 0.2
            case .custom(let value):
                return Double(value)
            }
        }
    }
    
    enum Action: Equatable {
        case inputBill(String)
        case updateTipButtonTapped(Tip)
        case decrementSplitButtonTapped
        case incrementSpolitButtonTapped
        case resetButtonTapped
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case let .inputBill(bill):
            state.bill = bill.doubleValue ?? 0
            state.calculation()
            return .none
        case let .updateTipButtonTapped(tip):
            state.tip = tip
            state.calculation()
            return .none
        case .decrementSplitButtonTapped:
            if state.split - 1 >= 1 {
                state.split -= 1
            }
            state.calculation()
            return .none
        case .incrementSpolitButtonTapped:
            state.split += 1
            state.calculation()
            return .none
        case .resetButtonTapped:
            state = State(bill: 0,
                          tip: .none,
                          split: 1,
                          result: .init(
                            amountPerPerson: "0",
                            totalBill: "0",
                            totalTip: "0"))
            return .none
        }
    }
}
