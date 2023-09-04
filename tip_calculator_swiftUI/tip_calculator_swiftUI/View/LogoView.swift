//
//  LogoView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/08/31.
//

import SwiftUI

struct LogoView: View {
    @EnvironmentObject var calculaotrVM: CalculatorVM
    
    var topLogoTextA: AttributedString {
        var leftText = AttributedString("Mr")
        leftText.font = ThemeFont.demibold(ofSize: 16)
        
        var rightText = AttributedString("TIP")
        rightText.font = ThemeFont.bold(ofSize: 24)
        return leftText + rightText
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Image(uiImage: UIImage(named: "icCalculatorBW")!)
                .resizable()
                .frame(width: 48)
            VStack(alignment: .leading, spacing: -8) {
                Text(topLogoTextA)
                Text("Calculator")
                    .font(ThemeFont.demibold(ofSize: 20))
            }
        }
        .frame(height: 48)
        .onTapGesture {
            calculaotrVM.reset()
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .environmentObject(CalculatorVM())
    }
}
