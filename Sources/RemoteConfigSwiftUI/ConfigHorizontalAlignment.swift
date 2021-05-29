import SwiftUI

public enum ConfigHorizontalAlignment: String {

    case center
    case leading
    case trailing

    func toSwiftUI() -> HorizontalAlignment {
        switch self {
        case .center: return .center
        case .leading: return .leading
        case .trailing: return .trailing
        }
    }
}

extension ConfigHorizontalAlignment: Equatable, Codable {}

