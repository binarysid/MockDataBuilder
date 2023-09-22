import Foundation

public struct MockDataBuilder {
    public static func buildFrom<T: Decodable>(bundle: Bundle, resource: String) -> T?{
        
        guard let url = bundle.url(forResource: resource, withExtension: nil) else {
            return nil
        }

        do {
            let data = try createModelRawData(fromURL: url)
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        } catch {
            return nil
        }
    }

    static func createModelRawData(fromURL: URL) throws -> Data {
        try Data(contentsOf: fromURL)
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
