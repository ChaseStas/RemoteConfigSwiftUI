import UIKit

extension String {
    func getRGBA() -> (r: UInt8, b: UInt8, g: UInt8, a: UInt8)? {
        let r, g, b, a: UInt8

        if hasPrefix("#") {
            let start = self.index(self.startIndex, offsetBy: 1)
            let hexColor = String(self[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = UInt8((hexNumber & 0xff0000) >> 16)
                    g = UInt8((hexNumber & 0x00ff00) >> 8)
                    b = UInt8(hexNumber & 0x0000ff)
                    a = 1

                    return (r,g,b,a)
                }
            }
        }
        return nil
    }
}
