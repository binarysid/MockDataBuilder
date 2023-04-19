import XCTest
@testable import MockDataBuilder

final class MockDataBuilderTests: XCTestCase {
    
    func test_mock_builder() {
        do {
            let data = try XCTUnwrap(MockDataBuilder.buildFrom(bundle: .module, resource: "products", extensions: "json", type: ProductData.self))
            XCTAssert(data.products.count>0, "no products found")
        } catch {
            XCTFail("Mock data build failed")
        }
        
    }
//    override func setUp() {
//
//
//    }
//    override func tearDown() {
//
//    }
}
