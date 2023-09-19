// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftformat:disable all
// swiftlint:disable all

import UIKit

// MARK: - Asset Catalogs

internal enum Colors {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let brandLight = ColorAsset(name: "brandLight")
  internal static let grayButton = ColorAsset(name: "grayButton")
  internal static let grayLine = ColorAsset(name: "grayLine")
  internal static let grayView = ColorAsset(name: "grayView")
  internal static let greenButton = ColorAsset(name: "greenButton")
  internal static let white = ColorAsset(name: "white")
}

// MARK: - Implementation Details
internal final class ColorAsset {
  internal fileprivate(set) var name: String

  internal typealias Color = UIColor
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
  }
}



private final class BundleToken {
    static let bundle: Bundle = {
        return Bundle(for: BundleToken.self)
    }()
}
