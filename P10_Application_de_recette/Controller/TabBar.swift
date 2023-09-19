//
//  TabBar.swift
//  P10_Application_de_recette
//
//  Created by charlesCalvignac on 01/02/2023.
//

import Foundation
import UIKit

class TabBar {
    
    func setupUITabBarItemBorder() -> UILabel {

        let tabBarItemRightBorder = UILabel()
        tabBarItemRightBorder.frame = CGRect(
            x: 0,
            y: UIScreen.main.bounds.height - 40,
            width: UIScreen.main.bounds.width / 2,
            height: 40
        )
        tabBarItemRightBorder.layer.addWaghaBorder(
            edge: .left,
            color: .gray,
            thickness: 10
        )
        
        return tabBarItemRightBorder
    }
    
}
