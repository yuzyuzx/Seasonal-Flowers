import SwiftUI

struct CategoryHome: View {
  //    private let store: [Flower] = Flower.flowers
  
  // Store側で更新されるデータを監視
  // データが更新されるとViewに反映する
  @ObservedObject var store = FlowersStore()
  
  var body: some View {
    NavigationStack {
      // 状態変数の値によって処理を分岐する
      switch store.state {
          // データ読込中
        case .loading:
          ProgressView("loading...")
        case .failed:
          // データの読み込み失敗
          VStack {
            VStack(alignment: .leading, spacing: 10.0) {
              Text("データの取得に失敗しました。")
              Text("リロードボタンを押して、再度お試しください。")
            }
            Button(action: {
              Task {
                // データを非同期で取得する
                // 非同期処理は`Task`の中で呼び出す
                await store.load(.onReload)
              }
            }) {
              Text("Reload")
                .bold()
                .padding()
                .frame(width: 100, height: 50)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(25)
            }
            Text("【検証用として、初回起動時にエラーが発生するように設定しています。】")
              .padding()
              .foregroundStyle(.blue)
          }
        case .success:
          // データの読み込み完了
          List {
            ForEach(Flower.Season.allCases, id:\.self) { season in
              if let data = store.seasons[season.rawValue] {
                CategoryRow(
                  seasonName: season.rawValue,
                  items: data
                )
              }
            } // end ForEach
            // List余白調整
            .listRowInsets(EdgeInsets())
            
          } // end List
          .navigationTitle("Flowers")
          
      } // end switch
    } // end NavigationStack
    .task {
      // データを非同期で取得する
      // 非同期処理は`task`の中で呼び出す
      await store.load(.onApper)
    }
    
  } // end body
}

#Preview {
  CategoryHome()
}
