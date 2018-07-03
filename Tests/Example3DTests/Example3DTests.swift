import XCTest
@testable import Example3D

final class Example3DTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Example3D().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
