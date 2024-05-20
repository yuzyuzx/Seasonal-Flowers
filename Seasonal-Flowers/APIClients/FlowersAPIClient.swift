import Foundation

/**
 WebAPIリクエスト処理
 */
struct FlowersAPIClient {
  
  /**
   指定したエンドポイントのデータを取得する
   */
  func fetch(_ endpoint: String) async throws -> [Flower] {
    
    do {
      // `loading`確認用処理（指定した秒数の処理を止める）
      try! await Task.sleep(nanoseconds: 1_000_000_000)
      
      // `URL`が正しい形式かチェック
      guard let url = URL(string: endpoint) else {
        throw APIClientError.InvalidURL
      }
      
//      let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
       let urlRequest = URLRequest(url: url)
      
      let (data, response) = try await URLSession.shared.data(for: urlRequest)
      
      // `URLResponse`型から`HTTPURLResponse`型へダウンキャスト
      guard let httpResponse = response as? HTTPURLResponse else {
        throw APIClientError.ResponseError
      }
      
      // ステータスコードをチェック
      switch httpResponse.statusCode {
        case 500...:
          throw HTTPError.Server
        case 400...:
          throw HTTPError.Client
        default:
          break
      }
      
      // データが空ではないか
      guard !data.isEmpty else {
        throw APIClientError.NoData
      }
      
      do {
        // 取得したJSONデータを`Flower`型に変換する
        return try JSONDecoder().decode([Flower].self, from: data)
      } catch {
        throw JSONError.DecodeFailed
      }
      
    } catch {
      throw error
    }
  }
}
