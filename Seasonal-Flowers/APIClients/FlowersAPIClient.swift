import Foundation

struct FlowersAPIClient {
  func fetch() async throws -> [Flower] {
//        let jsonDataFileUrl = "https://yuzyuzx.github.io/api/seasonal-flowers/flowerData.json"
//        let jsonDataFileUrl = "https://yuzyuzx.github.io/api/seasonal-flowers/flowerDat.json"
    
//    let jsonDataFileUrl = ""
    let jsonDataFileUrl = "https://yuzyuzx.github.io/api/test/empty.json"
    
//    let jsonDataFileUrl = "https://yuzyuzx.github.io/api/test/ok.txt"
    
    do {
      
      guard let url = URL(string: jsonDataFileUrl) else {
        throw APIClientError.InvalidURL
      }
      
      //      let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
      let urlRequest = URLRequest(url: url)
      
      let (data, response) = try await URLSession.shared.data(for: urlRequest)
      
      guard let httpResponse = response as? HTTPURLResponse else {
        throw APIClientError.ResponseError
      }
      
      switch httpResponse.statusCode {
        case 500...:
          throw HTTPError.Server
        case 400...:
          throw HTTPError.Client
        default:
          break
      }
      
      guard !data.isEmpty else {
        throw APIClientError.NoData
      }
      
      do {
        return try JSONDecoder().decode([Flower].self, from: data)
      } catch {
        throw JSONDecodeError.Failed
      }
      
    } catch {
      throw error
    }
  }
}
