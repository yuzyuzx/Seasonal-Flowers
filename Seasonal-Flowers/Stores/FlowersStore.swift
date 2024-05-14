import Foundation

@MainActor
class FlowersStore: ObservableObject {
  @Published private(set) var flowers = [Flower]()
  
  private(set) lazy var seasons: [String: [Flower]] =
  Dictionary(
    grouping: flowers,
    by: { $0.season.rawValue}
  )
  
  func load() async {
    try! await Task.sleep(nanoseconds: 1_000_000_000)
    
    let jsonDataFileUrl = "https://yuzyuzx.github.io/api/seasonal-flowers/flowerData.json"
    let url = URL(string: jsonDataFileUrl)!
    
    // let (data, urlRequest) = try await URLSession.shared.data(from: url)
    let (data, _) = try! await URLSession.shared.data(from: url)
    
    let jsonData = try! JSONDecoder().decode([Flower].self, from: data)
    flowers = jsonData
  }
  
}
