import Foundation

enum HTTPError: Error, LocalizedError {
  // 400系エラー
  case Client
  
  // 500系エラー
  case Server
  
  var errorDescription: String? {
    switch self {
      case .Client:
        return "4xx Client Error クライアントエラー"
      case .Server:
        return "5xx Server Error サーバエラー"
    }
  }
}
