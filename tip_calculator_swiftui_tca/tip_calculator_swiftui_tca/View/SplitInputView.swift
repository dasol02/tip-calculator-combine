//
//  SplitInputView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/08/31.
//

import SwiftUI
import ComposableArchitecture

enum SplitInputViewAction {
    case decrementSplitButtonTapped
    case incrementSpolitButtonTapped
}

struct SplitInputView: View {
    var split: Int
    var action: ((SplitInputViewAction) -> Void)?
    
    var body: some View {
            HStack(spacing: 24) {
                HeaderView(topText: "Split", bottomText: "the total")
                HStack(spacing: 0){
                    Button {
                        action?(.decrementSplitButtonTapped)
                    } label: {
                        Text("-")
                            .padding()
                            .foregroundColor(.white)
                    }
                    .frame(width: 56, height: 56)
                    .background(
                        RoundedCorners(color: ThemeColor.primary, tl: 8, bl: 8)
                    )
                    
                    Text("\(split)")
                        .padding()
                        .font(ThemeFont.bold(ofSize: 20))
                        .frame(maxWidth: .infinity)
                        .background(.white)
                    Button {
                        action?(.incrementSpolitButtonTapped)
                    } label: {
                        Text("+")
                            .padding()
                            .foregroundColor(.white)
                    }
                    .frame(width: 56, height: 56)
                    .background(
                        RoundedCorners(color: ThemeColor.primary, tr: 8, br: 8)
                    )
                }
            }
    }
}

struct SplitInputView_Previews: PreviewProvider {
    static var previews: some View {
        SplitInputView(split: 1)
    }
}
