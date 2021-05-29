import Foundation
import SwiftUI

public struct ConfigPadding {
    public let value: CGFloat
    public var edge: Edge

    public init(value: CGFloat, edge: Edge = .all) {
        self.value = value
        self.edge = edge
    }

    public enum Edge: String, Codable, Equatable {
        case all
        case bottom
        case horizontal
        case leading
        case top
        case trailing
        case vertical

        func toSwiftUI() -> SwiftUI.Edge.Set {
            switch self {
            case .all: return .all
            case .horizontal: return .horizontal
            case .vertical: return .vertical
            case .top: return .top
            case .leading: return .leading
            case .trailing: return .trailing
            case .bottom: return .bottom
            }
        }
    }
}

extension ConfigPadding: Codable, Equatable {}

public extension View {
    @ViewBuilder
    func padding(_ value: ConfigPadding?) -> some View {
        if let value = value {
            self.padding(value.edge.toSwiftUI(), value.value)
        } else {
            self
        }
    }
}
