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
   データ取得イベントの型
   */
  enum Action {
    // 初回起動時に指定
    case onApper
    
    // リロードボタンイベントに指定
    case onReload
  }
  
  /**
   非同期でデータを取得するメソッド
   */
  func load(_ action: Action) async {
    
    // 状態変数を読込中にする
    state = .loading
    
    let endpoint = selectEndpoint(action)
    
    do {
      flowers = try await FlowersAPIClient().fetch(endpoint)
      // 状態変数を読み込み完了にする
      state = .success
    } catch {
      print(error.localizedDescription)
      // 状態変数を読み込み失敗にする
      state = .failed
    }
  }
  
  /**
   エンドポイントを選択する
   テスト用としてActionケースが`onApper`の場合（初回起動時）は、
   エラー用ファイルを指定する
   */
  func selectEndpoint(_ action: Action) -> String {
    let baseUrl = "https://yuzyuzx.github.io/api/seasonal-flowers"
    
    let okfile = "flowerData.json"
    let ngfile = "notExsits.json"
    
    let f = switch action {
    case .onApper:
      ngfile
    case .onReload:
      okfile
    }
    
    return String(format: "%@/%@", baseUrl, f)
  }
  
}
