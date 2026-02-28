# パーソナル服装提案アプリ

1. 目的  
   天気の情報から個人の体感差に合わせた服装を提案してくれる。
2. コンセプト
   一般的な基準ではなく、ユーザーの過去のフィードバックを学修し、使えば使うほど自分専用に進化するパーソナライズ型服装アドバイザー  
3. 提案ロジックの構造
   1. 気象データ:気温、湿度、風速、降水確率、時間ごとの推移。
   2. ユーザー設定:初期設定(暑がり・標準・寒がり等)をローカルに保存
   3. 時間帯のロジック:出発、滞在、帰宅時などの気温で判定
   4. 服装提案はGemini APIに一任し、気象データとユーザー設定をまとめてプロンプトとして渡す  
4. 服装提案  
   Gemini APIが以下の情報をもとに提案を生成  
   ・気象データ(気温、体感温度、湿度、風速、天気コード)  
   ・ユーザーの体質設定(暑がり・標準・寒がり)  
   ・活動時間帯(出発・滞在・帰宅)ごとの気象推移  
5. ユーザー体験の差別化  
   ・タイムコンテキスト重視:　「最高/最低」ではなく、ユーザーの活動時間帯(例:朝8時と夜18時)のピンポイントな気象データを抽出  
   ・重ね着のリコメンド: 1日の寒暖差が10℃を超える場合、脱ぎ記しやすい構成を提示  
6. システムアーキテクチャ  
   以下の4層アーキテクチャ(Data, Repository, ViewModel, UI)を採用する。
   ・Data: 外部API通信、ローカルDB保存、位置情報取得などのデータソース層
   ・Repository: Data層からのデータを抽象化し、ViewModelへ提供する層
   ・ViewModel: 状態管理とビジネスロジック(UIとRepositoryの仲介役)
   ・UI: FlutterのWidgetによる画面表示(ViewModelの状態を監視して再描画)
   lib/  
  ui/  
    home/  
      home_view.dart (メイン画面)  
      home_view_model.dart (状態管理: Riverpod等)  
    onboarding/  
      onboarding_view.dart (初期設定)  
      onboarding_view_model.dart  
  view_model/  
    ※各画面専用でない共通のViewModelや状態管理プロバイダがあれば配置  
  repository/  
    weather_repository.dart / weather_repository_impl.dart
    user_repository.dart / user_repository_impl.dart
    clothing_advice_repository.dart (Gemini APIからアドバイスを取得するロジック)
  data/  
    models/
      weather.dart (WeatherData)  
      user_config.dart (UserConfig)  
    sources/  
      weather_api_client.dart (天気予報API通信 ※API選定中)
      local_storage_service.dart (SharedPreferences)
      location_service.dart (Geolocator)  
      gemini_api_client.dart (Gemini API通信)
7. 実装コンポーネント  
   1. データモデル  
      ・WeatherData: 気温、体感温度、湿度、風速、天気コード、時間別リスト  
      ・UserConfig: 初期体質(暑がり・標準・寒がり)、花粉症の有無  
   2. 外部API  
      ・天気予報API: 気象データ取得(※選定中)  
      ・Geolocator: 現在地取得  
      ・Gemini API: 気象データとユーザー設定をもとに服装アドバイスを生成  
   3. ローカルデータ保存  
      ・SharedPreferences: ユーザー設定をデバイス内に保存  
        ・base_preference:String (暑がり・標準・寒がり)  
        ・has_pollen_allergy:bool  
8. データモデル  
    1. WeatherData(気象データ)  
       ・currentTemp:　現在の気温  
       ・apparentTemp: 現在の体感温度  
       ・humidity: 湿度  
       ・windSpeed: 風速  
       ・weatherCode: 天気状態  
       ・hourlyForecast: 24時間分の体感温度リスト(帰宅時の気温判定に使用)  
    2. UserConfig(ユーザー設定 ※SharedPreferencesにローカル保存)  
       ・basePreference: 暑がり、標準、寒がりの初期属性  
       ・hasPollenAllergy: 花粉フラグ  
9. 運用・拡張プラン  
    ・自分専用のクローゼット連携: ユーザーが自分の持っている服を登録し、「今日はあなたの持っている○○が最適です」と具体的に出してくれる機能  
    ・ヘルスケア連携: 体温や心拍数データから、「今日が少し体調が悪いかもしれないので暖かくしてください」という高度な補正  
    ・SNSへの共有: 「今日の最適スタイル」を画像でシェアできる機能  
10. 開発ステップ  
    1. 基礎機能の実装  
       ・現在地の取得と天気予報APIからの気象データの取得(※API選定中)  
       ・Gemini APIへのプロンプト構築と服装アドバイスの表示  
    2. パーソナライズの導入  
       ・SharedPreferencesによるユーザー設定(体質・花粉)のローカル保存  
       ・オンボーディング画面でのプロフィール入力フロー  
    3. UXの強化  
       ・時間軸ロジックに基づいた「帰宅時の冷え込み」アラート機能  
       ・Geminiアドバイスの精度改善(プロンプトチューニング)  
11. UI遷移・画面構成  
    1. 初回起動時  
       ・アプリの趣旨説明  
       ・プロフィール設定: 暑がり、寒がり等の選択(ローカル保存)  
       ・位置情報・通知の許可  
    2. メイン画面  
       ・現在地と現在時刻  
       ・アドバイスエリア(Gemini APIによるメッセージ)  
       ・推奨される服装のイラスト、アイコン  
       ・時間軸リスト: 「出発、昼、帰宅」それぞれの予想天気と服装アイコンの横並び表示  
    3. フィードバック  
       ・フィードバックボタン  
       ・過去の履歴  
       ・完了演出  
    4. 設定画面  
       ・設定変更: 花粉症モードのオン・オフや、基本属性(暑がり等)の再設定(ローカル保存)