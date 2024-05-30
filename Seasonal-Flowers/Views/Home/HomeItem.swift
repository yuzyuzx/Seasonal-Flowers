import SwiftUI

struct HomeItem: View {
  let flower: Flower
  
  var body: some View {
    
      AsyncImage(url: URL(string: flower.imageName)) { phase in
        switch phase {
          case .failure:
            Image(systemName: "photo")
              .font(.largeTitle)
            
          case .success(let image):
            VStack(alignment: .leading) {
              image
                .resizable()
                .frame(width: 155, height: 155)
                .clipShape(.rect(cornerRadius: 25))
              
              Text(flower.name)
                .foregroundColor(.primary)
                .font(.caption)
            }
            .padding(.leading, 15)
            
          default:
            ProgressView()
        }
      } // end AsyncImage closure
      
  } // end body
}

#Preview {
  HomeItem(flower: Flower.flowers[0])
}
