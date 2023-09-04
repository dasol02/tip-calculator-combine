//
//  HeaderView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/08/31.
//

import SwiftUI

struct HeaderView: View {
    @State var topText: String
    @State var bottomText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: -5) {
            Text(topText)
                .font(ThemeFont.bold(ofSize: 18))
            Text(bottomText)
                .font(ThemeFont.regular(ofSize: 16))
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(topText: "Enter", bottomText: "your bill")
    }
}
