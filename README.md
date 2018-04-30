# sample-swift-xcode

Swift言語にて、Xcodeを使用したサンプルコードの置き場。

## リポジトリのルール

- サンプルコードのみとしてください（実際に運用で使用する場合は別のリポジトリへ）
- 追加は自由です
- 更新は、あからさまな不具合は自由、改変の場合は作成者にご一報ください
- サンプルなので基本的にはmasterブランチにどんどん追加していくことを許容します

# リポジトリの構成

リポジトリの構成は概ね下記のような構成とします。

root/  
├ project/  
│  ├ xxx.xcodeproj/  
│  ├ files
│  │  ：  
└ README.md

## 実行環境

- Xcode8.3以上
- macOS 10.12以上
- Swift3.0以上
- CocoaPods1.1.1以上

## 使い方

- 実行環境を整える
- 各プロジェクトのディレクトリに移動し、Podfileがあれば [pod install] する
- xcproj あるいは xcworkspace を開き、実行する

