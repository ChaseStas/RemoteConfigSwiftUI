import SwiftUI

extension View {
    @ViewBuilder
    func multilineTextAlignment(_ alignment: TextAlignment?) -> some View {
        if let alignment = alignment {
            self.multilineTextAlignment(alignment)
        } else {
            self
        }
    }

    @ViewBuilder
    func padding(_ value: CGFloat?) -> some View {
        if let value = value {
            self.padding(value)
        } else {
            self
        }
    }

    @ViewBuilder
    func configForegroundColor(_ value: Color?) -> some View {
        if let value = value {
            self.foregroundColor(value)
        } else {
            self
        }
    }
}

