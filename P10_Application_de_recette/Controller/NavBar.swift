//
//  NavBar.swift
//  P10_Application_de_recette
//
//  Created by charlesCalvignac on 01/02/2023.
//

import Foundation
import UIKit

class NavBar {
    
    // MARK: Nav bar item
    func setupNavigationBar() -> UIStackView {

        let label = UILabel()
        label.text = Strings.titleRecip.text
        label.font = UIFont(name: Strings.fontMarkerFelt.text, size: CGFloat(Constants.titleSize.value))
        label.textColor = .white

        let stackView = UIStackView(arrangedSubviews: [label])
        stackView.axis = .horizontal
        stackView.frame.size = CGSize(width: label.frame.size.width, height: label.frame.size.height)
        stackView.spacing = 20

        return stackView

    }

}
