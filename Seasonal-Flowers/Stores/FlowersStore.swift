import Foundation

class FlowersStore: ObservableObject {
  @Published private(set) var flowers = [Flower]()
  @Published private(set) var state: Stateful = Stateful.loading
  
  private(set) lazy var seasons: [String: [Flower]] =
  Dictionary(
    grouping: flowers,
    by: { $0.season.rawValue}
  )
  
  func load() async throws {
    state = Stateful.loading
     try! await Task.sleep(nanoseconds: 1_000_000_000)
    
    let jsonDataFileUrl = "https://yuzyuzx.github.io/api/seasonal-flowers/flowerData.json"
//    let jsonDataFileUrl = "https://yuzyuzx.github.io/api/seasonal-flowers/flowerDat.json"
//    let jsonDataFileUrl = "https://yuzyuzx.github.io/api/seasonal-flowers/flowerData.json"
    
    guard let url = URL(string: jsonDataFileUrl) else {
      throw APIClientError.InvalidURL
    }
    
    do {
      var urlRequest = URLRequest(url: url)
//      urlRequest.cachePolicy = .returnCacheDataElseLoad
      
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
        state = Stateful.success
        
      } catch {
        state = Stateful.failed
        throw JSONDecodeError.Failed
      }
      
    } catch {
      state = Stateful.failed
      throw APIClientError.RequestFailed(error)
    }
  }
  
}
