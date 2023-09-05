//
//  CustomTipButtonView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/09/04.
//

import SwiftUI
import ComposableArchitecture

struct CustomTipButtonView: View {
    @State private var customtipValue: Int = 0
    @State private var openAlert: Bool = false
    
    let store: StoreOf<Calculator>
    
    var attributedText: AttributedString {
        var tipValue: AttributedString
        
        if customtipValue != 0 {
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
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Button {
                openAlert.toggle()
            } label: {
                Text(attributedText)
                    .padding()
                    .foregroundColor(.white)
            }
            .onChange(of: viewStore.tip, perform: { newValue in
                if viewStore.tip.stringValue != customtipValue.stringValue {
                    customtipValue = 0
                }
            })
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(customtipValue.stringValue == viewStore.tip.stringValue ? ThemeColor.secondary : ThemeColor.primary)
            )
            .alert("Enter custom tip", isPresented: $openAlert) {
                TextField("Make it generous",
                          value: $customtipValue,
                          formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                Button("OK", action: submit)
                Button("Cancel", role: .cancel) {}
            }
        }
    }
    
    func submit() {
        self.store.send(.updateTipButtonTapped(Tip.custom(value: customtipValue)))
    }
}

struct CustomTipButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTipButtonView(
            store: Store(initialState: Calculator.State(),
                         reducer: { Calculator() }
                        )
        )
    }
}
