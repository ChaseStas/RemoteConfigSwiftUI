import SwiftUI

public struct ConfigButton {
    public let value: String
    public let color: ConfigColor?
    public let multilineTextAlignment: ConfigTextAlignment?

    public init(
        value: String,
        color: ConfigColor? = nil,
        multilineTextAlignment: ConfigTextAlignment? = nil
    ) {
        self.value = value
        self.color = color
        self.multilineTextAlignment = multilineTextAlignment
    }
}

extension ConfigButton: Codable, Equatable {}

public extension ConfigButton {
    func toSwiftUI() -> some View {
        Button(action: {}, label: {
            Text("Button")
        })
    }
}
