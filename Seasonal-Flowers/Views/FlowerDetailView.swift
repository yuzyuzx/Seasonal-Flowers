import SwiftUI

struct FlowerDetailView: View {
  let flower: Flower
  
  var body: some View {
    
    ScrollView {
      flower.image
        .resizable()
        .scaledToFit()
        .frame(height: 300)
//        .clipped()
//        .listRowInsets(EdgeInsets())
      
      VStack(alignment: .leading) {
        Text(flower.name)
          .font(.title)
        
        Divider()
        
        VStack(alignment: .leading, spacing: 10.0) {
          Text("\(flower.name)について")
            .font(.title2)
          Text(flower.description)
          
        }
      }
      .padding()
    }
    .navigationTitle(flower.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  NavigationStack {
    FlowerDetailView(flower: Flower.flowers[0])
  }
}
