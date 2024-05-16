import Foundation

enum APIClientError: Error, LocalizedError {
  case InvalidURL
  case ResponseError
  case NoData
  
  var errorDescription: String? {
    switch self {
      case .InvalidURL:
        return "URLが正しくありません"
      case .ResponseError:
        return "レスポンスエラーです"
      case .NoData:
        return "ファイルの内容が空です"
    }
  }
}
