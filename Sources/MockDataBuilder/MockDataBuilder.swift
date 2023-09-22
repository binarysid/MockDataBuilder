import Foundation

public struct MockDataBuilder {
    public static func buildFrom<T: Decodable>(bundle: Bundle, fileName: String) -> T {
        let data: Data

        guard let url = bundle.url(forResource: fileName, withExtension: nil) else {
            fatalError("Couldn't find \(fileName) in main bundle.")
        }

        do {
            data = try createModelRawData(fromURL: url)
        } catch {
            fatalError("Couldn't load \(fileName) from bundle:\n\(error)")
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
        }
    }

    static func createModelRawData(fromURL: URL) throws -> Data {
        try Data(contentsOf: fromURL)
    }
}
