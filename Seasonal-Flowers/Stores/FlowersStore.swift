import Foundation

@MainActor
class FlowersStore: ObservableObject {
  @Published private(set) var flowers = [Flower]()
  @Published private(set) var state: Stateful = Stateful.loading
  
  private(set) lazy var seasons: [String: [Flower]] =
  Dictionary(
    grouping: flowers,
    by: { $0.season.rawValue}
  )
  
  func load() async {
    try! await Task.sleep(nanoseconds: 1_000_000_000)
    state = Stateful.loading
    
    do {
      try await fetch()
      state = Stateful.success
    } catch {
      print(error)
      state = Stateful.failed
    }
  }
  
  func fetch() async throws {
    //    let jsonDataFileUrl = "https://yuzyuzx.github.io/api/seasonal-flowers/flowerData.json"
//    let jsonDataFileUrl = "https://yuzyuzx.github.io/api/seasonal-flowers/flowerDat.json"
    //    let jsonDataFileUrl = "https://yuzyuzx.github.io/api/seasonal-flowers/flowerData.json"
    
    let jsonDataFileUrl = "https://yuzyuzx.github.io/api/ok.txt"
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
          throw HTTPError.ServerError
        case 400...:
          throw HTTPError.ClientError
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
      throw error
    }
  }
  
}
