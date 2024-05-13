import Foundation
import SwiftUI

struct Flower {
  var id: String
  var name: String
  var description: String
  
  var imageName: String
  var image: Image {
    Image(imageName)
  }
}
