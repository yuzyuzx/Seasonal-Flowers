import Foundation

/**
 APIデータを読み込むときの状態を表す型
 */
enum StateLoadFlowersData {
  // 読み込み中
  case loading
  
  // 読み込み失敗
  case failed
  
  // 読み込み完了
  case success
}
