//
//  CustomButton.swift
//  Bharat - Alinea Invest
//
//  Created by Bharat Juneja on 12/11/20.
//

import Foundation
import UIKit
enum ButtonStyle{
    case subtitleBtn
    case titleBtn
}
class CustomButton: UIButton {
    var style: ButtonStyle? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    override func draw(_ rect: CGRect) {
        if style == .subtitleBtn {
            self.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
            self.setTitleColor(.gray, for: .normal)
            self.setTitleColor(.black, for: .highlighted)
            self.setTitleColor(.purple, for: .selected)
        }
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
