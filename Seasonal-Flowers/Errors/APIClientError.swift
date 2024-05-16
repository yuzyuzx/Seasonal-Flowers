import Foundation

enum APIClientError: Error {
  case InvalidURL
  case ResponseError
  case NoData
}

enum HTTPError: Error {
  // 400系エラー
  case ClientError
  
  // 500系エラー
  case ServerError
}

enum JSONDecodeError: Error {
  case Failed
}
