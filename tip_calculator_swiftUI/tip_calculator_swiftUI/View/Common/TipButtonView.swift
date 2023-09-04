//
//  TipButtonView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/09/04.
//

import SwiftUI

struct TipButtonView: View {
    @State var defaultTip: Tip
    @Binding var tipInput: Tip
    @State private var openAlert: Bool = false
    
    var attributedText: AttributedString {
        var tipValue = AttributedString(defaultTip.stringValue)
        tipValue.font = ThemeFont.bold(ofSize: 20)
        
        var percent = AttributedString("%")
        percent.font = ThemeFont.demibold(ofSize: 14)
        
        return tipValue + percent
    }
    var body: some View {
        Button {
            print(defaultTip.stringValue)
            tipInput = defaultTip
        } label: {
            Text(attributedText)
                .padding()
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(defaultTip == tipInput ? ThemeColor.secondary : ThemeColor.primary)
        ).onTapGesture {
            print("asdsds")
        }
    }
}

struct TipButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TipButtonView(defaultTip: .none, tipInput: .constant(.none))
    }
}


