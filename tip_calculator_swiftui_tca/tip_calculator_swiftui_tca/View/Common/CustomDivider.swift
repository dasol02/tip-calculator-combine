//
//  CustomDivider.swift
//  tip_calculator_swiftUI
//
//  Created by dasol lee on 2023/08/31.
//

import SwiftUI

struct CustomDivider: View {
  let color: Color
  let height: CGFloat

  init(color: Color = .gray.opacity(0.5),
       height: CGFloat = 0.5) {
    self.color = color
    self.height = height
  }

  var body: some View {
    Rectangle()
      .fill(color)
      .frame(height: height)
      .edgesIgnoringSafeArea(.horizontal)
  }
}
