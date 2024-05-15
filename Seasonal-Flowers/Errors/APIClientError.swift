import Foundation

enum APIClientError: Error {
  case InvalidURL
  case ResponseError
  case NoData
}

enum HTTPError: Error {
  case ClientError
  case ServerError
}

enum JSONDecodeError: Error {
  case Failed
}
