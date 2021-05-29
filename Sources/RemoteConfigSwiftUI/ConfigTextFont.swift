import SwiftUI

public struct ConfigTextFont {
    let name: String?
    let size: CGFloat
    let system: SystemFont?

    enum SystemFont: String, Codable, Equatable {
        case black
        case bold
        case heavy
        case light
        case medium
        case regular
        case semibold
        case thin
        case ultraLight

        func toSwiftUI() -> Font.Weight {
            switch self {
            case .black: return .black
            case .bold: return .bold
            case .heavy: return .heavy
            case .light: return .light
            case .medium: return .medium
            case .regular: return .regular
            case .semibold: return .semibold
            case .thin: return .thin
            case .ultraLight: return .ultraLight
            }
        }

        #if !os(macOS)
        func toUIKit() -> UIFont.Weight {
            switch self {
            case .black: return .black
            case .bold: return .bold
            case .heavy: return .heavy
            case .light: return .light
            case .medium: return .medium
            case .regular: return .regular
            case .semibold: return .semibold
            case .thin: return .thin
            case .ultraLight: return .ultraLight
            }
        }
        #endif
    }
}

extension ConfigTextFont: Codable, Equatable {}

extension View {
    @ViewBuilder
    func font(_ config: ConfigTextFont?) -> some View {
        if let value = config {
            if let name = value.name {
                self.font(.custom(name, size: value.size))
            } else if let system = value.system {
                self.font(.system(size: value.size, weight: system.toSwiftUI()))
            } else {
                self
            }
        } else {
            self
        }
    }
}
