import Foundation
import SwiftUI

/**
 表示するデータの構造体
 */
struct Flower: Identifiable, Codable, Hashable {
  var id: String
  var name: String
  var description: String
  
  var imageName: String
//  var image: Image {
//    Image("images/\(imageName)")
//  }
  
  
  var season: Season
  // `CaseIterable`は`case`の宣言順通りに列挙する
  // https://developer.apple.com/documentation/swift/caseiterable
  enum Season: String, CaseIterable, Codable {
    // caseの順番がViewでの表示順になる
    case spring = "spring"
    case summer = "summer"
    case autumn = "autumn"
    case winter = "winter"
  }
  
}
