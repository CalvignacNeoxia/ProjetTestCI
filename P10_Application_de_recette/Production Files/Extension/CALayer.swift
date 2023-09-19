import Foundation
import UIKit

extension CALayer {

    enum Position {
        case top
        case right
        case middle
        case left
    }

    func addWaghaBorder(edge: Position, color: UIColor, thickness: CGFloat) {
            let border = CALayer()
            switch edge {
            case .top:
                border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 1)
            case .middle:
                border.frame = CGRect(x: self.frame.width / 2, y: 0, width: 1, height: self.frame.height)
            case .right:
                border.frame = CGRect(x: self.frame.width, y: 0, width: 1, height: self.frame.height)
            case .left:
                border.frame = CGRect(x: self.frame.width, y: 0, width: 1, height: self.frame.height)
            }
        border.backgroundColor = color.cgColor
        self.addSublayer(border)
    }

}
