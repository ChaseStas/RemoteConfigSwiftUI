import Foundation
import SwiftUI

public struct ConfigText {
    public let value: String
    public var color: ConfigColor? = nil
    public var multilineTextAlignment: ConfigTextAlignment? = nil
    public var padding: ConfigPadding? = nil
    public var font: ConfigTextFont? = nil
}

extension ConfigText: Codable, Equatable, SwiftUIConfigurable {}

public extension ConfigText {
    func toSwiftUI() -> some View {
        Text(value)
            .font(font)
            .foregroundColor(color?.toSwiftUI())
            .multilineTextAlignment(multilineTextAlignment?.toSwiftUI())

    }
}

#if DEBUG
struct TextPreview: PreviewProvider {
    static let config = ConfigText(
        value:"\(UIFont.fontNames(forFamilyName: "Avenir").joined(separator: "\n"))" +  UIFont.familyNames.joined(separator: "\n")
    )
    static var previews: some View {
        VStack {
            config.toSwiftUI()
                .foregroundColor(.white)
                .background(Color.blue)
        }
    }
}

#endif