    import XCTest
    @testable import RemoteConfigSwiftUI

    final class RemoteConfigSwiftUITests: XCTestCase {

        let textRawJson = "{ \"value\": \"Text value\"}"
        let decoder = JSONDecoder()

        func testHStack() {
            let rawJson = "{ \"spacing\": 10, \"value\": \(textRawJson)  }"
            let data = rawJson.data(using: .utf8)!
            let output = try! decoder.decode(ConfigHStack.self, from: data)
            print(output)
        }

        func testColor() {
            let colorInHex = "#ff00ff"
            let config = ConfigColor(hex: colorInHex)
            XCTAssertNotNil(config)
            XCTAssertEqual(config?.red, 255)
            XCTAssertEqual(config?.green, 0)
            XCTAssertEqual(config?.blue, 255)

            let config2: ConfigColor = "#ffff00"
            XCTAssertEqual(config2.red, 255)
            XCTAssertEqual(config2.green, 255)
            XCTAssertEqual(config2.blue, 0)

            let rawJson = "{\n\"color\":\"#0000ff\",\"color2\": { \"red\": 255, \"blue\":200,\"green\":100 } }"

            struct Test: Codable {
                let color: ConfigColor
                let color2: ConfigColor
            }

            let data = rawJson.data(using: .utf8)!
            XCTAssertNotNil(data, "Data is nil")

            let output = try! decoder.decode(Test.self, from: data)
            XCTAssertEqual(output.color.red, 0)
            XCTAssertEqual(output.color.green, 0)
            XCTAssertEqual(output.color.blue, 255)
            XCTAssertEqual(output.color2.red, 255)
            XCTAssertEqual(output.color2.green, 100)
            XCTAssertEqual(output.color2.blue, 200)

        }
    }
