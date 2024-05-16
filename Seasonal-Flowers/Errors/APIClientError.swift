import Foundation

enum APIClientError: Error, LocalizedError {
  // 不正なURL
  case InvalidURL
  
  // レスポンスエラー
  case ResponseError
  
  // ファイルの内容が空
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
