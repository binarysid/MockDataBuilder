import XCTest
@testable import MockDataBuilder

final class MockDataBuilderTests: XCTestCase {
    
    func test_mock_builder_with_valid_file_url() {
        let data: [Product] = MockDataBuilder.buildFrom(bundle: .module, fileName: "products.json")
        XCTAssert(data.count>0)
    }
}
