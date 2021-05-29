import SwiftUI

public struct ConfigBorder {
    public let width: CGFloat
    public let color: ConfigColor?
    public let multilineTextAlignment: ConfigTextAlignment?
}

extension ConfigBorder: Codable, Equatable {}

