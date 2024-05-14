import Foundation

/*
struct FlowersAPIClient {
  let jsonDataFileUrl = "https://yuzyuzx.github.io/api/seasonal-flowers/flowerData.json"
  
  func load() async throws -> [Flower] {
    let url = URL(string: jsonDataFileUrl)!
    
//    let (data, urlRequest) = try await URLSession.shared.data(from: url)
    let (data, _) = try await URLSession.shared.data(from: url)
    
    let jsonData = try JSONDecoder().decode([Flower].self, from: data)
    return jsonData
  }
}
*/
