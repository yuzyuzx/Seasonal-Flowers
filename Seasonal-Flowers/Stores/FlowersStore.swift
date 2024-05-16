import Foundation

/**
 `View`からイベントを受け取り`APIClient`に接続してデータを取得します
 */
@MainActor
class FlowersStore: ObservableObject {
  // データ取得時の状態を表す変数
  @Published private(set) var state: StateLoadFlowersData = .loading
  
  // 取得成功時にデータが入ります
  @Published private(set) var flowers = [Flower]()
  
  // `season`プロパティごとにデータをグルーピングします
  // spring | summer | autumn | winter
  // 非同期でデータを読み込むため遅延プロパティで定義します
  private(set) lazy var seasons: [String: [Flower]] =
  Dictionary(
    grouping: flowers,
    by: { $0.season.rawValue}
  )
  
  /**
   非同期でデータを取得するメソッド
   */
  func load() async {
    // `loading`確認用処理（1秒処理を止めます）
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
