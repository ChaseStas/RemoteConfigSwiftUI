import SwiftUI

public enum SomeViewConfigurable: Equatable {
    case hstack(ConfigHStack)
    case image(ConfigImage)
    case text(ConfigText)
    case vstack(ConfigVStack)
    case zstack(ConfigZStack)
}

extension SomeViewConfigurable: Codable {

    enum CodableError: Error {
        case notSupported
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let text = try? container.decode(ConfigText.self) {
            self = .text(text)
        } else if let image = try? container.decode(ConfigImage.self) {
            self = .image(image)
        } else if let hStack = try? container.decode(ConfigHStack.self) {
            self = .hstack(hStack)
        } else if let vStack = try? container.decode(ConfigVStack.self) {
            self = .vstack(vStack)
        } else if let zStack = try? container.decode(ConfigZStack.self) {
            self = .zstack(zStack)
        }
        throw CodableError.notSupported
    }

    public func encode(to encoder: Encoder) throws {
        fatalError()
    }
}

extension SomeViewConfigurable: SwiftUIConfigurable {
    @ViewBuilder
    public func toSwiftUI() -> some View {
        switch self {
        case let .image(value):
            value.toSwiftUI()
        case let .text(value):
            value.toSwiftUI()
        case let .hstack(value):
            value.toSwiftUI()
        case let .vstack(value):
            value.toSwiftUI()
        case let .zstack(value):
            value.toSwiftUI()
        }
    }
}
