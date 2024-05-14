import SwiftUI

struct CategoryItem: View {
  let flower: Flower
  
  var body: some View {
    VStack(alignment: .leading) {
      flower.image
        .renderingMode(.original)
        .resizable()
        .frame(width: 155, height: 155)
        .cornerRadius(5)
      Text(flower.name)
        .foregroundStyle(.primary)
        .font(.caption)
    }
    .padding(.leading, 15)
  }
}

#Preview {
  CategoryItem(flower: Flower.flowers[0])
}
