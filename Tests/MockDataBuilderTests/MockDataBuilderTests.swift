import XCTest
@testable import MockDataBuilder

final class MockDataBuilderTests: XCTestCase {
    
    func test_mock_builder() {
        do {
            let data: [Product] = try XCTUnwrap(MockDataBuilder.buildFrom(bundle: .module, resource: "products.json"))
            XCTAssert(data.count>0)
        } catch {
            XCTFail()
        }
    }
}
