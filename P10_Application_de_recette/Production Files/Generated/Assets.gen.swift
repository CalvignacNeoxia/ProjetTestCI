// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftformat:disable all
// swiftlint:disable all

import UIKit

// MARK: - Asset Catalogs

internal enum Assets {
  internal static let logo = ImageAsset(name: "logo")
}

// MARK: - Implementation Details


internal struct ImageAsset {
  internal fileprivate(set) var name: String

  internal typealias Image = UIImage

  internal var image: Image {
    let bundle = BundleToken.bundle
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

private final class BundleToken {
    static let bundle: Bundle = {
        return Bundle(for: BundleToken.self)
    }()
}
