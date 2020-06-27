# 何をする

## ことの発端

- カスタムキャストの画面をWindowsに投影し、OBS Studioでその画面を取り込みたいと考えた
- iPhone で、画面を収録をし、配信できるらしい
    - カスタムキャストの配信モードを、ニコ生アプリで配信できることを知った
    - ニコ生アプリは、iOSのコントロールセンターから画面収録を行える
    - ニコ生アプリは、iOSの提供する機能によって収録・配信しているだろうと、iOSのUIとシームレスにつながる動きから感じた

## ReplayKit を使えばよさそう

- 画面や音声を録画、ストリーミング配信をするためのフレームワークらしい
- https://developer.apple.com/documentation/replaykit

## Broadcast Extensionの存在

- Broadcast 用の Extension target が存在する
    - Broadcast Upload Extension
        - RPBroadcastSampleHandler を継承したクラスが初期配置
    - Broadcast Setup UI Extension
        - UIViewController を継承したクラスが初期配置
            - UIViewController に extensionContext なるプロパティが生えてるなんて初めて知った…
