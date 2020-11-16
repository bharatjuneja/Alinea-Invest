//
//  InternalConstraints.swift
//  Bharat - Alinea Invest
//
//  Created by Bharat Juneja on 13/11/20.
//

import Foundation
import UIKit
extension UIView {
    func addWidthConstraint(width: CGFloat) {
        let cons = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: self.superview, attribute: .width, multiplier: 1, constant: width)
        self.addConstraint(cons)
    }
    func addHeightConstraint(height: CGFloat) {
        let cons = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self.superview, attribute: .height, multiplier: 1, constant: height)
        self.addConstraint(cons)
    }
//    func addCenterXConstraint() {
//        let xConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: self.superview , attribute: .centerX, multiplier: 1, constant: 0)
//        self.addConstraint(xConstraint)
//    }
//    func addCenterYConstraint() {
//        let yConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: self.superview , attribute: .centerX, multiplier: 1, constant: 0)
//        self.addConstraint(yConstraint)
//    }

}
