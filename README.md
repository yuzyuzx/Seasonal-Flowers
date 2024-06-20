# アプリについて

## アプリ名

Seasonal Flowers

### 概要

このアプリはiOSアプリ開発の学習を目的として作成されたシンプルなアプリです。  
季節ごとの花の一覧を表示し、花の名前、説明、写真を閲覧することができます。

### デモ動画

![demo](https://github.com/yuzyuzx/seasonal-flowers/assets/67046330/0b7a6f97-9d4a-49a7-ab5d-71eb2f9c4e0f)

### ソースコード

[GitHub](https://github.com/yuzyuzx/seasonal-flowers/tree/main)  
[API](https://yuzyuzx.github.io/api/seasonal-flowers/flowerData.json)

### アプリ開発の目的

このアプリはiOSアプリ開発の一通りのプロセスを学習するために開発しました。  
自分で設計・作成したAPI(jsonファイル)をサーバーに配置し、非同期でのデータの取得・表示に焦点を当てています。

### 実装内容

#### データ取得モジュール

- 自身で設計したAPIからデータを取得しています。
  - このAPIは`GitHub Pages`をエンドポイントとして使用しています。
- データの読み込みは`async`機能を利用した非同期処理で実装しており、エラーハンドリング機能も組み込まれています。
- データの取得状態を管理する型を用意し、状態に応じて画面の表示を切り替えています。
  - 状態は`読込中`、`読み込み完了`、`読み込み失敗`の3つです。
- データ取得が失敗した場合には、再度データを読み込むリトライ機能も実装しています。

#### UIレイアウト

- UIレイアウトに関しては一覧画面と詳細画面の2画面を提供しています。
- `ScrollView`を使用して一覧表示を実現し、`NavigationStack`を使用して画面遷移を行っています。

### 使用技術

- Swift 5.9
- SwiftUI
- Xcode 15

### 確認デバイス

#### 実機

- iPhone13

#### シュミレーター

- iPhone15 Pro
- iPhone15
