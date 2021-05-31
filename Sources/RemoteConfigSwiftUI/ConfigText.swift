import Foundation
import SwiftUI

public struct ConfigText {
    public let value: String
    public var color: ConfigColor? = nil
    public var multilineTextAlignment: ConfigTextAlignment? = nil
    public var padding: ConfigPadding? = nil
    public var font: ConfigTextFont? = nil

    public init(value: String,
                color: ConfigColor? = nil,
                multilineTextAlignment: ConfigTextAlignment? = nil,
                padding: ConfigPadding? = nil,
                font: ConfigTextFont? = nil) {
        self.value = value
        self.color = color
        self.multilineTextAlignment = multilineTextAlignment
        self.padding = padding
        self.font = font
    }
}

extension ConfigText: Codable, Equatable {}

public extension ConfigText {
    func toSwiftUI(_ configure: (ConfigText) -> ConfigText = {$0}) -> some View {
        let val = configure(self)
        return Text(val.value)
            .font(val.font)
            .foregroundColor(val.color?.toSwiftUI())
            .multilineTextAlignment(val.multilineTextAlignment?.toSwiftUI())

    }
}
