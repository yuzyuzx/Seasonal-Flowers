import SwiftUI


struct HomeRow: View {
  var seasonName: String
  var items: [Flower]
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(seasonName)
        .font(.headline)
        .padding(.leading, 15)
        .padding(.top, 5)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top, spacing: 0) {
          ForEach(items) { flower in
            NavigationLink {
              FlowerDetailView(flower: flower)
            } label: {
              HomeItem(flower: flower)
            }
          }
        }
      }
      .frame(height: 185)
    }
  }
}

#Preview {
  let flowers = Flower.flowers
  
  return HomeRow(
    seasonName: flowers[0].season.rawValue,
    items: Array(flowers.prefix(5))
  )
}
