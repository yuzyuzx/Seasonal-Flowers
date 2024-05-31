import SwiftUI

struct FlowerDetailView: View {
  let flower: Flower
  
  var body: some View {
    
    ScrollView {
      AsyncImage(url: URL(string: flower.image)) { phase in
        switch phase {
          case .failure:
            Image(systemName: "photo")
              .font(.largeTitle)
          case .success(let image):
            image
              .resizable()
              .scaledToFit()
              .frame(height: 300)
          default:
            ProgressView()
        }
      } // end AsyncImage closure
      
      VStack(alignment: .leading) {
        Text(flower.name)
          .font(.title)
        
        Divider()
        
        VStack(alignment: .leading, spacing: 10.0) {
          Text("\(flower.name)について")
            .font(.title2)
          Text(flower.description)
          
        } // end VStack
      } // end VStack
      .padding()
    } // end ScrollView
    
    .navigationTitle(flower.name)
    .navigationBarTitleDisplayMode(.inline)
    
  } // end body
}

#Preview {
  NavigationStack {
    FlowerDetailView(flower: Flower.flowers[0])
  }
}
