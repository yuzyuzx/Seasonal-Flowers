import Foundation

enum JSONError: Error, LocalizedError {
  // jsonデコードに失敗
  case DecodeFailed
  
  var errorDescription: String? {
    switch self {
      case .DecodeFailed:
        return "デコード処理に失敗しました"
    }
  }
}

