## 開発環境の作り方
#### ソースをクローンする。
- srcディレクトリをマウントする設定のため`git clone [クローン元のURL] src`で現在のディレクトリにクローンしてください。

- .envにてipやポートを指定しています。
`vagrant plugin install dotenv`でgemをインストール後、環境変数を読み込めるようにしてください。(sample.envを基に.envを作成してください。)
#### 現状の開発環境
nodeとnginxだけ入っています。