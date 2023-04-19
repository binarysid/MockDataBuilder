import Foundation

public struct MockDataBuilder {
    public static func buildFrom<T: Decodable>(bundle: Bundle, resource: String, extensions:String, type: T.Type) -> T?{
        do {
            guard let url = bundle.url(forResource: resource, withExtension: extensions) else {
                return nil
            }
            let data = createModelRawData(fromURL: url)
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        } catch {
            return nil
        }
    }
    static func createModelRawData(fromURL: URL) -> Data {
        do {
            let data = try Data(contentsOf: fromURL)
            return data
        } catch {
            return Data()
        }
    }
}
