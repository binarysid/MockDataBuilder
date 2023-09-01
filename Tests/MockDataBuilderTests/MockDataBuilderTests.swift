import XCTest
@testable import MockDataBuilder

final class MockDataBuilderTests: XCTestCase {
    
    func test_mock_builder() {
        do {
            let data = try XCTUnwrap(MockDataBuilder.buildFrom(bundle: .module, resource: "products", extensions: "json", type: [Product].self))
            XCTAssert(data.count>0)
        } catch {
            XCTFail()
        }
    }
}
