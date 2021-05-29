import SwiftUI

public struct ConfigVStack {
    var alignment: ConfigHorizontalAlignment = .center
    var spacing: CGFloat? = nil
    let value: [SomeViewConfigurable]
}

extension ConfigVStack: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try container.decodeIfPresent(ConfigHorizontalAlignment.self, forKey: .alignment) {
            self.alignment = value
        }

        if let value = try container.decodeIfPresent(CGFloat.self, forKey: .spacing) {
            self.spacing = value
        }

        self.value = try container.decode([SomeViewConfigurable].self, forKey: .value)
    }
}

extension ConfigVStack: Equatable {}


extension ConfigVStack: SwiftUIConfigurable {
    @ViewBuilder
    public func toSwiftUI() -> some View {
        VStack(alignment: alignment.toSwiftUI(), spacing: spacing) {
            ForEach(value.indices) { index in
                value[index].toSwiftUI()
            }
        }
    }
}

