//
//  UiView+Extensions.swift
//  ContainerApp
//
//  Created by Madhusudhan Reddy Putta on 02/07/21.
//

import Foundation
import UIKit

protocol Reusable {}

extension UIView: Reusable {}

extension Reusable where Self: UIView {

    // FIXME: The code below is not related to `Reusable` protocol. Consider moving it to another place

    static var nib: UINib {
        let nibName = String(describing: self)

        return UINib(nibName: nibName, bundle: nil)
    }

    static func instantiateFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            preconditionFailure("The nib \(nib) expected its root view to be of type \(self)")
        }

        return view
    }
}
