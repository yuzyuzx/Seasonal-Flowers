import Foundation

enum JSONDecodeError: Error, LocalizedError {
  case Failed
  
  var errorDescription: String? {
    switch self {
      case .Failed:
        return "デコード処理に失敗しました"
    }
  }
}

