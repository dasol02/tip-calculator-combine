//
//  UiResponder.swift
//  tip-calculator
//
//  Created by dasol lee on 2023/08/25.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
