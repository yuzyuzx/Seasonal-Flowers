import SwiftUI

struct FlowerDetailView: View {
  let flower: Flower
  
  var body: some View {
    
    ScrollView {
      flower.image
        .resizable()
        .scaledToFill()
        .frame(height: 400)
        .clipped()
        .listRowInsets(EdgeInsets())
      
      VStack(alignment: .leading) {
        HStack {
          Text(flower.name)
            .font(.title)
        }
        
//        HStack {
//          Text(flower.name)
//          Spacer()
//          Text(flower.name)
//        }
//        .font(.subheadline)
//        .foregroundStyle(.secondary)
        
        Divider()
        
        Text("概要 \(flower.name)")
          .font(.title2)
        Text(flower.description)
      }
      .padding()
    }
    .navigationTitle(flower.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  FlowerDetailView(flower: Flower.flowers[0])
}
