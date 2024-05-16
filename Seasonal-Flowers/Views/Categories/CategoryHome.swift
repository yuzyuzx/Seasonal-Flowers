import SwiftUI

struct CategoryHome: View {
  //    private let store: [Flower] = Flower.flowers
  @ObservedObject var store = FlowersStore()
  
  
  var body: some View {
    NavigationStack {
      switch store.state {
        case .loading:
          ProgressView("loading...")
        case .failed:
          VStack {
            Text("データの取得に失敗しました\nReloadボタンを押して再実行してください")
            Button(action: {
              Task {
                await store.load()
              }
            }) {
              Text("Reload")
            }
            
          }
        case .success:
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
      await store.load()
    } // end task
  } // end body
}

#Preview {
  CategoryHome()
}
