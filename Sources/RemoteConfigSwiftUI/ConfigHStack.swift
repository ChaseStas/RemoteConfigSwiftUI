import SwiftUI

public struct ConfigHStack {
    var alignment: ConfigVerticalAlignment = .center
    var spacing: CGFloat? = nil
    let value: [SomeViewConfigurable]

    public init(alignment: ConfigVerticalAlignment = .center,
                spacing: CGFloat? = nil,
                value: [SomeViewConfigurable]) {
        self.alignment = alignment
        self.spacing = spacing
        self.value = value
    }
}

extension ConfigHStack: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try container.decodeIfPresent(ConfigVerticalAlignment.self, forKey: .alignment) {
            self.alignment = value
        }

        if let value = try container.decodeIfPresent(CGFloat.self, forKey: .spacing) {
            self.spacing = value
        }

        self.value = try container.decode([SomeViewConfigurable].self, forKey: .value)
    }
}

extension ConfigHStack: Equatable {}


extension ConfigHStack: SwiftUIConfigurable {
    @ViewBuilder
    public func toSwiftUI() -> some View {
        HStack(alignment: alignment.toSwiftUI(), spacing: spacing) {
            AnyView(
                ForEach(value.indices) { index in
                    value[index].toSwiftUI()
                }
            )
        }
    }
}

