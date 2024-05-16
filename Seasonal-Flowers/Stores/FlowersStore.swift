import Foundation

/**
 `View`からイベントを受け取り`APIClient`に接続してデータを取得する
 */
@MainActor
class FlowersStore: ObservableObject {
  // データ取得時の状態を表す変数
  // `private(set)` でView側から直接更新できないようにする
  @Published private(set) var state: StateLoadFlowersData = .loading
  
  // 取得成功時のデータ格納変数
  @Published private(set) var flowers = [Flower]()
  
  // `season`プロパティごとにデータをグルーピングする
  // `season` = spring | summer | autumn | winter
  // 非同期でデータを読み込むため遅延プロパティで定義する
  private(set) lazy var seasons: [String: [Flower]] =
  Dictionary(
    grouping: flowers,
    by: { $0.season.rawValue}
  )
  
  /**
   非同期でデータを取得するメソッド
   */
  func load() async {
    // 状態変数を読込中にする
    state = .loading
    
    do {
      flowers = try await FlowersAPIClient().fetch()
      // 状態変数を読み込み完了にする
      state = .success
    } catch {
      print(error.localizedDescription)
      // 状態変数を読み込み失敗にする
      state = .failed
    }
  }
  
}
