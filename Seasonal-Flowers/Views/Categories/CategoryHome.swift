import SwiftUI

struct CategoryHome: View {
//    private let store: [Flower] = Flower.flowers
  @ObservedObject var store = FlowersStore()
  
  
  var body: some View {
    NavigationStack {
      if store.flowers.isEmpty {
        ProgressView("loading...")
      } else {
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
      }
      
    } // end NavigationStack
    
    .task {
      do {
        try await store.load()
      } catch {
        // エラー処理
        
      }
    }
    
  } // end body
}

#Preview {
  CategoryHome()
}
