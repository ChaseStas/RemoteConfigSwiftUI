import SwiftUI

public enum ConfigTextAlignment: String {
    case leading
    case center
    case trailing

    func toSwiftUI() -> TextAlignment {
        switch self {
        case .leading: return .leading
        case .center: return .center
        case .trailing: return .trailing
        }
    }
}

extension ConfigTextAlignment: Codable, Equatable {}
