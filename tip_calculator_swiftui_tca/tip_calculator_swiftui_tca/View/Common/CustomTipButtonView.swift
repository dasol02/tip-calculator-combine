//
//  CustomTipButtonView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/09/04.
//

import SwiftUI
import ComposableArchitecture

struct CustomTipButtonView: View {
    var inputTip: Tip
    var action: ((Tip) -> Void)?
    
    @State private var customtipValue: Int = 0
    @State private var openAlert: Bool = false
    
    var attributedText: AttributedString {
        var tipValue: AttributedString
        
        if inputTip.stringValue == customtipValue.stringValue {
            var percent = AttributedString("$")
            percent.font = ThemeFont.demibold(ofSize: 14)
            
            tipValue = AttributedString(customtipValue.stringValue)
            tipValue.font = ThemeFont.bold(ofSize: 20)
            
            tipValue = percent + tipValue
        } else {
            tipValue = AttributedString("Custom Tip")
            tipValue.font = ThemeFont.bold(ofSize: 20)
        }
        
        return tipValue
    }
    
    var body: some View {
        Button {
            openAlert.toggle()
        } label: {
            Text(attributedText)
                .padding()
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(customtipValue.stringValue == inputTip.stringValue ? ThemeColor.secondary : ThemeColor.primary)
        )
        .alert("Enter custom tip", isPresented: $openAlert) {
            TextField("Make it generous",
                      value: $customtipValue,
                      formatter: NumberFormatter())
                .keyboardType(.numberPad)
            Button("OK") {
                action?(Tip.custom(value: customtipValue))
            }
            Button("Cancel", role: .cancel) {}
        }
    }
    
}

struct CustomTipButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTipButtonView(inputTip: Tip.custom(value: 0))
    }
}
