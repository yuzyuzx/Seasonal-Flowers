import Foundation

@MainActor
class FlowersStore: ObservableObject {
  @Published private(set) var flowers = [Flower]()
  @Published private(set) var state: StateLoadFlowersData = .loading
  
  private(set) lazy var seasons: [String: [Flower]] =
  Dictionary(
    grouping: flowers,
    by: { $0.season.rawValue}
  )
  
  func load() async {
    try! await Task.sleep(nanoseconds: 1_000_000_000)
    state = .loading
    
    do {
      flowers = try await FlowersAPIClient().fetch()
      state = .success
    } catch {
      print(error.localizedDescription)
      state = .failed
    }
  }
  
}
