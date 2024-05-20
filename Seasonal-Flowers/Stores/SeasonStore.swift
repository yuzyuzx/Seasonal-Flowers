import Foundation

struct SeasonStore {
  
  /**
   画面表示用の季節名を取得する
   */
  func getDisplaySeasonName(season: String) -> String {
    let season = switch season {
    case "spring":
      "春"
    case "summer":
      "夏"
    case "autumn":
      "秋"
    case "winter":
      "冬"
    default:
      ""
    }
    
    return season
  }
}
