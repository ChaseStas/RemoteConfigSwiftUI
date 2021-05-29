import SwiftUI

public protocol SwiftUIConfigurable {
    associatedtype ConfigurableView : View

    func toSwiftUI() -> ConfigurableView
}
