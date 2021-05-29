import SwiftUI

public enum ConfigVerticalAlignment: String {

    case bottom
    case center
    case firstTextBaseline
    case lastTextBaseline
    case top

    func toSwiftUI() -> VerticalAlignment {
        switch self {
        case .bottom: return .bottom
        case .center: return .center
        case .firstTextBaseline: return .firstTextBaseline
        case .lastTextBaseline: return .lastTextBaseline
        case .top: return .top
        }
    }
}

extension ConfigVerticalAlignment: Equatable, Codable {}

