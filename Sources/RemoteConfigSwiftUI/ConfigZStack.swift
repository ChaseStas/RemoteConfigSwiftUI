import SwiftUI

public struct ConfigZStack {
    var alignment: ConfigAlignment = .center
    let value: [SomeViewConfigurable]

    public init(alignment: ConfigAlignment = .center,
                value: [SomeViewConfigurable]) {
        self.alignment = alignment
        self.value = value
    }
}

extension ConfigZStack: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try container.decodeIfPresent(ConfigAlignment.self, forKey: .alignment) {
            self.alignment = value
        }

        self.value = try container.decode([SomeViewConfigurable].self, forKey: .value)
    }
}

extension ConfigZStack: Equatable {}


extension ConfigZStack: SwiftUIConfigurable {
    @ViewBuilder
    public func toSwiftUI() -> some View {
        ZStack(alignment: alignment.toSwiftUI()) {
            AnyView(
                ForEach(value.indices) { index in
                    value[index].toSwiftUI()
                }
            )
        }
    }
}

