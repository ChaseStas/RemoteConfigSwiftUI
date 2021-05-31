import SwiftUI

public struct ConfigButton {
    public let value: SomeViewConfigurable
    public let color: ConfigColor?
    public let multilineTextAlignment: ConfigTextAlignment?

    public init(value: SomeViewConfigurable,
                color: ConfigColor? = nil,
                multilineTextAlignment: ConfigTextAlignment? = nil) {
        self.value = value
        self.color = color
        self.multilineTextAlignment = multilineTextAlignment
    }
}

extension ConfigButton: Codable, Equatable {}

public extension ConfigButton {
    func toSwiftUI(action: @escaping () -> ()) -> some View {
        Button(action: action, label: value.toSwiftUI)
    }
}
