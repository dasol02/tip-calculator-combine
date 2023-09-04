//
//  UIView.swift
//  tip-calculator
//
//  Created by dasol lee on 2023/08/25.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
