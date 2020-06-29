# Replay Kit のリファレンスを読み下したメモ

[ReplayKit の リファレンス](https://developer.apple.com/documentation/replaykit) を読んで把握したことを記載していく。

なにやら macOS 11.0+ 以降でも有効になるらしい。

## Replay Sharing

### RPScreenRecorder

- レコーダーオブジェクト
- おそらく配信の肝になるクラス
- shared オブジェクトがあり、ここから映像や音声を配信に流すのだろう
- デバイスにおいてレコーダーを使用できるのは一つのみらしい
- AVPlayerから録画はできないらしい
- `delegate: RPScreenRecorderDelegate` を持つ
- APIを見ると、スクリーンだけでなくカメラも使えそう？
    - `isCameraEnabled`
- 録画操作のAPIは `handler` を受け取る方式になっている
    - `startRecording(handler:((Error?) -> Void)?)
        - 録画開始のAPI
    - `stopRecording(handler:((RPPreviewViewController?, Error?) -> Void)?)
        - preview で再生内容を確認するUIを提供するための処理だろうか
    - `stopRecording(withOutput:URL, comhandler:((RPPreviewViewController?, Error?) -> Void)?)
        - こちらは録画完了した後そのまま出力するためのAPIっぽい
    - `startCapture(handler:completionHandler:)`
        - `handler: ((CMSampleBuffer, RPSampleBufferType, Error?) -> Void)?`
            - キャプチャ中、逐次呼びだされる模様
            - このハンドラー、 `RPBroadcastSampleHandler` の `processSampleBuffer` と同じパラメータを要求する

### RPScreenRecorderDelegate

- `didStopRecording`
- `didChangeAvailability`

### RPPreviewViewController

- 録画したコンテンツをプレビューしたり編集したりする
- UIViewController を継承しているからそのまま present(viewController:) に送ればよさそう
- stopRecording の handler に登場
    - sharedオブジェクトのhandlerが送るパラメータとなると、かなり隠蔽されている
- モードがある
    - preview
    - share
- `delegate: RPPreviewViewControllerDelegate` を持つ

### RPPreviewViewControllerDelegate

- `didFinish`
- `didFinishWithActivityTypes`
