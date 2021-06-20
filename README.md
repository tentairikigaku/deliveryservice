# DeliveryService

## Dependency
Flutter: 2.2.0-stable

Dart: 2.13.0

## Utils
- import_sorterコマンド

```
$ flutter pub run import_sorter:main
```

## Assetファイルについて
FlutterGenにより、コードを自動生成している。
```
$ brew install FlutterGen/tap/fluttergen //一度だけ実行
$ fluttergen
```

下記のようなコードで画像などを表示可能。
```
Assets.images.logo.images(
  image: 100,
  height: 100,
)
```
