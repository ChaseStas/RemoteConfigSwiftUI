import SwiftUI

public enum ConfigAlignment: String {
    case bottom
    case bottomLeading
    case bottomTrailing
    case center
    case leading
    case top
    case topLeading
    case topTrailing
    case trailing

    func toSwiftUI() -> Alignment {
        switch self {
        case .bottom: return .bottom
        case .bottomLeading: return .bottomLeading
        case .bottomTrailing: return .bottomTrailing
        case .center: return .center
        case .leading: return .leading
        case .top: return .top
        case .topLeading: return .topLeading
        case .topTrailing: return .topTrailing
        case .trailing: return .trailing
        }
    }
}

extension ConfigAlignment: Equatable, Codable {}

