//
//  CustomStackView.swift
//  Bharat - Alinea Invest
//
//  Created by Bharat Juneja on 12/11/20.
//

import Foundation
import UIKit
class CustomStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .horizontal
        distribution = .equalCentering
        alignment = .fill
        
        spacing = 10
        self.contentMode = .scaleToFill
        
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
