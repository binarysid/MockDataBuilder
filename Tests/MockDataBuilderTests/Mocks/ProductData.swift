//
//  ProductData.swift
//  ShoppingCart
//
//  Created by Linkon Sid on 19/4/23.
//
import Foundation

// MARK: - Product Model
struct ProductData: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}

enum CarListMockData {
    static let url = Bundle.main.url(forResource:"products",withExtension:"json")!
    
    static func createModelRawData() -> Data {
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            return Data()
        }
    }
    
    static func createModelMockData() -> [Product] {
        do {
            let data = createModelRawData()
            let productData = try JSONDecoder().decode(ProductData.self, from: data)
            return productData.products
        } catch {
            return []
        }
    }
//    func decode<T: Decodable>(type: T.Type, from data: Data) throws -> T
}
