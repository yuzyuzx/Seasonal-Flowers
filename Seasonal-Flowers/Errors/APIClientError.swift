import Foundation

enum APIClientError: Error {
//  case BadURL
  case RequestFailed(Error)
//  case InvalidResponse
//  case DecodingFailed(Error)
//  case HttpError(Int)
  
  case InvalidURL
  case ResponseError
  case NoData
//  case BadStatus(statusCode: Int)
//  case ServerError(statusCode: Int)
  
  
}

enum HttpError: Error {
  case ClientError
  case ServerError
}

enum JSONDecodeError: Error {
  case Failed
}
