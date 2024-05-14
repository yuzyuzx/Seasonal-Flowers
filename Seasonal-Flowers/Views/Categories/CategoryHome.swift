import SwiftUI

struct CategoryHome: View {
  private let flowers: [Flower] = Flower.flowers
  
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(Flower.Season.allCases, id:\.self) { season in
          if let data = Flower.flowerGroup[season.rawValue] {
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
    } // end NavigationStack
  } // end body
}

#Preview {
  CategoryHome()
}
