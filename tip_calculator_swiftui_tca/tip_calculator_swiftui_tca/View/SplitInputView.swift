//
//  SplitInputView.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/08/31.
//

import SwiftUI
import ComposableArchitecture

struct SplitInputView: View {
    let store: StoreOf<Calculator>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack(spacing: 24) {
                HeaderView(topText: "Split", bottomText: "the total")
                HStack(spacing: 0){
                    Button {
                        self.store.send(.decrementSplitButtonTapped)
                    } label: {
                        Text("-")
                            .padding()
                            .foregroundColor(.white)
                    }
                    .frame(width: 56, height: 56)
                    .background(
                        RoundedCorners(color: ThemeColor.primary, tl: 8, bl: 8)
                    )
                    
                    Text("\(viewStore.split)")
                        .padding()
                        .font(ThemeFont.bold(ofSize: 20))
                        .frame(maxWidth: .infinity)
                        .background(.white)
                    Button {
                        self.store.send(.incrementSpolitButtonTapped)
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
}

struct SplitInputView_Previews: PreviewProvider {
    static var previews: some View {
        SplitInputView(
            store: Store(
                initialState: Calculator.State(),
                reducer: {
                    Calculator()
                })
        )
    }
}
