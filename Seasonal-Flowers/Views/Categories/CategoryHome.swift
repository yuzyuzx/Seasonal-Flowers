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
            Text("データの取得に失敗しました\nReloadボタンを押して再実行してください")
            Button(action: {
              Task {
                await store.load()
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
      await store.load()
    }
    
  } // end body
}

#Preview {
  CategoryHome()
}
