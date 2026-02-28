# ホーム画面 (home_view.dart)

## 概要

アプリ起動後にユーザーが最初に見るメイン画面。  
現在地の気象データをもとに、Gemini APIが生成した今日の服装アドバイスを表示する。

---

## 表示要素

### 1. ヘッダーエリア
- 現在地の地名（Geolocatorで取得）
- 現在の日時（日付・曜日・時刻）

### 2. 現在の天気エリア
- 気温（現在の気温 `currentTemp`）
- 体感温度（`apparentTemp`）
- 天気アイコン（`weatherCode`に対応したアイコン）
- 湿度（`humidity`）
- 風速（`windSpeed`）

### 3. Geminiアドバイスエリア
- Gemini APIが生成した服装提案テキスト  
  （気象データ＋ユーザー体質設定を渡したプロンプトの返答）
- 暑がり/寒がり等の体質設定も反映したパーソナライズされたメッセージ
- 花粉症フラグがONの場合はマスクや花粉症対策の言及も含む

### 4. 推奨服装エリア
- 推奨される服装のイラストまたはアイコン
- 1日の寒暖差が大きい場合（10℃以上）は重ね着リコメンドを表示

### 5. 時間軸リスト（横並びカード）
以下の3つの時間帯ごとに予想天気・気温・服装アイコンを横並びで表示

| 時間帯 | 表示内容 |
|---|---|
| 出発時 | 予想気温 / 天気アイコン / 服装アイコン |
| 日中（昼） | 予想気温 / 天気アイコン / 服装アイコン |
| 帰宅時 | 予想気温 / 天気アイコン / 服装アイコン |

- `hourlyForecast`（24時間分の体感温度リスト）を使って各時間帯を算出
- 帰宅時に気温が大きく下がる場合は「冷え込みアラート」を表示

### 6. ナビゲーション
- 設定画面へ遷移するボタン（右上アイコン等）
- フィードバック画面へ遷移するボタン

---

## 状態管理（home_view_model.dart）

| 状態 | 型 | 説明 |
|---|---|---|
| `weatherData` | WeatherData? | 取得した気象データ |
| `adviceText` | String? | GeminiのAPIレスポンス（アドバイス文） |
| `isLoading` | bool | データ取得中のローディング状態 |
| `errorMessage` | String? | エラー時のメッセージ |
| `userConfig` | UserConfig? | SharedPreferencesから読み込んだユーザー設定 |

---

## ViewModel の責務

1. 起動時に `LocationService` から現在地を取得
2. `WeatherRepository` から気象データ（WeatherData）を取得
3. `UserRepository` からユーザー設定（UserConfig）をローカル読み込み
4. `ClothingAdviceRepository` に気象データ＋ユーザー設定を渡してGemini APIへリクエスト
5. 取得したアドバイスを `adviceText` に格納してUIを更新

---

## 使用するRepository / Data

| 依存先 | 用途 |
|---|---|
| `WeatherRepository` | 天気予報APIから気象データ取得 (※API選定中) |
| `UserRepository` | UserConfigのローカル読み込み (SharedPreferences) |
| `ClothingAdviceRepository` | Gemini APIへのプロンプト送信・アドバイス取得 |
| `LocationService` | 現在地（緯度経度）の取得 (Geolocator) |

---

## エラー・ローディングの扱い

- データ取得中: ローディングスピナーを表示
- 位置情報取得失敗: 手動で地名を入力するか、エラーメッセージを表示
- API通信失敗（天気/Gemini）: エラーメッセージを表示し、リトライボタンを表示
