//
//  Constants.swift
//  P10_Application_de_recette
//
//  Created by charlesCalvignac on 19/01/2023.
//

import Foundation
import UIKit

enum Constants: Float {

    // Nav Bar
    case imageViewNavBar
    case starHeight
    case starWidth

    // Font
    case titleSize
    case labelSize
    case subTitleSize

    // Name Recip
    case widthNameRecip
    case heightNameRecip
    case middleWidthNameRecip
    case heightWidthNameRecip

    var value: Float {
        switch self {
        case .imageViewNavBar: return 30.0
        case .titleSize: return 30.0
        case .labelSize: return 15.0
        case .subTitleSize: return 20.0
        case .starHeight: return 25
        case .starWidth: return 30
        case .widthNameRecip: return Float(UIScreen.main.bounds.width)
        case .heightNameRecip: return 40.0
        case .middleWidthNameRecip: return 125.0
        case .heightWidthNameRecip: return 125.0
        }
    }
}
