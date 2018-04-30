# Sample2

Alamofire、Moya、ObjectMapperを使用したサンプル。

## APIs
Moyaを使用している
EnumではAPIのIFは気にせずに何をするかをcaseに登録している
（そうすることによってIF起因の階層構造は作らなくて済む）

実際に利用者が呼ぶのは〜Clinetクラスで、APIごとにメソッドが分かれる

スタブ用のテストデータの設定が実装されており、切り替えも簡単にできる

ヘッダーの付与などはEndpointClosureの設定でいろいろカスタムできる

Get,Postなどが入り混じっていてもそこそこうまくかけるようになってる

## Models
APIが返すJSONをオブジェクト化したもの
ObjectMapperを使用している
エラーJSONを捌くあたりがどうにも微妙だが、これしかなさそう


