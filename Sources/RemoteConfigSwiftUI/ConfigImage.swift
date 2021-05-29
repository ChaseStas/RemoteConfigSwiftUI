import SwiftUI

public struct ConfigImage: SwiftUIConfigurable {
    public var name: String
    public var isSystem: Bool

    public init(name: String, isSystem: Bool) {
        self.name = name
        self.isSystem = isSystem
    }
}

extension ConfigImage: Codable {
    enum CodingKeys: String, CodingKey {
        case name, systemName
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if let value = try container.decodeIfPresent(String.self, forKey: .name) {
            self.name = value
            self.isSystem = false
            return
        }

        self.name = try container.decode(String.self, forKey: .name)
        self.isSystem = true
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: isSystem ? .systemName : .name)
    }
}

extension ConfigImage: Equatable {}

public extension ConfigImage {
    func toSwiftUI() -> some View {
        return isSystem ? Image(name) : Image(systemName: name)
    }
}
