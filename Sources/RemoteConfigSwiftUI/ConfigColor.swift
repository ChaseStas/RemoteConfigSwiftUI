import SwiftUI

public struct ConfigColor: Equatable, SwiftUIConfigurable {
    public let red: UInt8
    public let green: UInt8
    public let blue: UInt8
    public var alpha: UInt8 = 1

    public init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8 = 1) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }

    public init?(hex: String) {
        if let (r,g,b,a) = hex.getRGBA() {
            self.red = r
            self.green = g
            self.blue = b
            self.alpha = a
            return
        }
        return nil
    }
}

extension ConfigColor: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(hex: value)!
    }
}

extension ConfigColor: Codable {
    enum CodingKeys: String, CodingKey {
        case red, green, blue
        case alpha
        case hex
    }

    enum Errors: Error {
        case noValueFound
    }

    public init(from decoder: Decoder) throws {
        if let container = try? decoder.container(keyedBy: CodingKeys.self) {
            red = try container.decode(UInt8.self, forKey: .red)
            blue = try container.decode(UInt8.self, forKey: .blue)
            green = try container.decode(UInt8.self, forKey: .green)
            if let value = try container.decodeIfPresent(UInt8.self, forKey: .alpha) {
                alpha = value
            }
            return
        } else if let singleContainer = try? decoder.singleValueContainer() {
            let hex = try singleContainer.decode(String.self)
            if let (r,g,b,a) = hex.getRGBA() {
                self.red = r
                self.green = g
                self.blue = b
                self.alpha = a
                return
            }
        }
        throw Errors.noValueFound
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(red, forKey: .red)
        try container.encode(green, forKey: .green)
        try container.encode(blue, forKey: .blue)
        try container.encode(alpha, forKey: .alpha)
    }
}


public extension ConfigColor {
    func toSwiftUI() -> Color {
        Color(.sRGB,
              red: Double(red)/255.0,
              green: Double(green)/255.0,
              blue: Double(blue)/255.0,
              opacity: Double(alpha))
    }
}
