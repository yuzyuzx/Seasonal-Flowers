import Foundation

/**
 APIデータを読み込み時の状態を表す型
 */
enum Stateful<Value> {
  // 読み込み中
  case loading
  
  // 失敗
  // エラーの内容を保持
  case failed(Error)
  
  // 読み込み完了
  // 読み込んだデータを保持
  case success(Value)
}
