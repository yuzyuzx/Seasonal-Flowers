import Foundation

class FlowersStore: ObservableObject {
  @Published private(set) var flowers = [Flower]()
  
  private(set) lazy var seasons: [String: [Flower]] =
  Dictionary(
    grouping: flowers,
    by: { $0.season.rawValue}
  )
  
  func load() async throws {
    // try! await Task.sleep(nanoseconds: 1_000_000_000)
    
    let jsonDataFileUrl = "https://yuzyuzx.github.io/api/seasonal-flowers/flowerData.json"
    
    guard let url = URL(string: jsonDataFileUrl) else {
      throw APIClientError.InvalidURL
    }
    
    do {
      var urlRequest = URLRequest(url: url)
      urlRequest.cachePolicy = .returnCacheDataElseLoad
      
      let (data, response) = try await URLSession.shared.data(for: urlRequest)
      
      guard let httpResponse = response as? HTTPURLResponse else {
        throw APIClientError.ResponseError
      }
      
      switch httpResponse.statusCode {
        case 500...:
          throw HttpError.ServerError
        case 400...:
          throw HttpError.ClientError
        default:
          break
      }
      
      guard !data.isEmpty else {
        throw APIClientError.NoData
      }
      
      do {
        let jsonData = try JSONDecoder().decode([Flower].self, from: data)
        flowers = jsonData
        
      } catch {
        throw JSONDecodeError.Failed
      }
      
    } catch {
      throw APIClientError.RequestFailed(error)
    }
  }
  
}
