//
//  TrendingViewModel.swift
//  Bharat - Alinea Invest
//
//  Created by Bharat Juneja on 13/11/20.
//

import Foundation
import UIKit
class TrendingViewModel {
    let topGainers = [ Stock(name: "Medifast", code: "MEDI", gainPercent: 50.78, image:  "Medifast"),
                       Stock(name: "Pinterest", code: "PINS", gainPercent: -4.77, image: "Pinterest"),
                       Stock(name: "Slack Technologies", code: "WORK", gainPercent: -5.99, image: "Slack"),
                       Stock(name: "Evoqua Water", code: "AQUA", gainPercent: 5.99, image: "Evoqua")
    ]
    let topSellers = [
        Stock(name: "Slack Technologies", code: "WORK", gainPercent: -5.99, image: "Slack"),
        Stock(name: "Evoqua Water", code: "AQUA", gainPercent: 5.99, image: "Evoqua")
    ]
}
