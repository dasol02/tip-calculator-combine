//
//  CalculatorVM.swift
//  tip-calculator
//
//  Created by dasol lee on 2023/08/25.
//

import Foundation
import Combine

class CalculatorVM: ObservableObject{
    @Published var bill: Double {
        didSet {
            transform()
        }
    }
    @Published var tip: Tip {
        didSet {
            transform()
        }
    }
    @Published var split: Int {
        didSet {
            transform()
        }
    }
    @Published var result: Result
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.bill = 0
        self.tip = .none
        self.split = 1
        self.result = .init(amountPerPerson: "0", totalBill: "0", totalTip: "0")
    }
    
    func transform() {
        print("\(bill), \(tip), \(split)")
        let totalTip = getTipAmount(bill: bill, tip: tip)
        let totalBill = bill + totalTip
        let amountPerPerson = totalBill / Double(split)
        result = Result(
            amountPerPerson: amountPerPerson.currencyFormatted,
            totalBill: totalBill.currencyFormatted,
            totalTip: totalTip.currencyFormatted)

    }
    
    func reset() {
        self.bill = 0
        self.tip = .none
        self.split = 1
        self.result = .init(amountPerPerson: "0", totalBill: "0", totalTip: "0")
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


