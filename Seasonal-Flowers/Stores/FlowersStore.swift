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
      flowers = try await FlowersAPIClient().fetch()
      state = Stateful.success
    } catch {
      print(error.localizedDescription)
      state = Stateful.failed
    }
  }
  
}
