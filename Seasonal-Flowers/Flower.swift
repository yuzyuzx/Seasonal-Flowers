import Foundation
import SwiftUI

struct Flower: Identifiable {
  var id: String
  var name: String
  var description: String
  
  var imageName: String
  var image: Image {
    Image(imageName)
  }
  
  var season: Season
  /*
   `CaseIterable`は`case`の宣言順通りに列挙する
   https://developer.apple.com/documentation/swift/caseiterable
   */
  enum Season: String, CaseIterable {
    case spring = "春"
    case summer = "夏"
    case autumn = "秋"
    case winter = "冬"
  }
}
