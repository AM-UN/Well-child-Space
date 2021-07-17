# Well-child-Space
インターネット上で子育てに悩みを抱えている人が気軽に相談できるQ＆Aサイトです。

## URL
https://www.well-child-space.com/

テストログインユーザー :  
メールアドレス : wellchildspace@gmail.com  
パスワード : password

相談と回答の投稿を行ったり、いいねをつけるにはログインが必要ですが、相談と回答の閲覧はログインなしでできます。  

# 制作背景  
私は現在、学校に通えない子供たちのためのオンラインスクールの講師を勤めています。  
スクールには、コロナ渦で学校に通えなくなってしまった子、人間関係に悩んでしまった子、何かしらの障害を抱えている子など、様々なバックグラウンドの子供たちが在籍しています。私は授業の最後やslackのメッセージなどでお母様方と接する機会があるのですが、
その中で、子育ての大変さを感じる場面が多々ありました。
例えば、なかなか学校に行きたがらないお子さんとの向き合い方や、勉強をどのように教えていけばいいか、仕事と子育ての両立など、色んな悩みや不安を抱えている方が多くいるのを感じました。
また、コロナ禍になってから、ママ友同士が悩み相談や情報交換する機会が減り、不安やストレスを必要以上に抱えてしまい、子供などに強く当たってしまう報告が増えていることをニュースで知りました。  
そのような子育てへの疑問や不安、ストレスを抱えた人たちがそれぞれの悩みを共有したり、情報交換したりすることによって、子育てをする人たちの負担を軽減するだけでなく、結果として親子や家族間の関係がいい方向に向かうのではないかと考えました。そのため、今回、子育てに悩みを抱えた人たちがオンライン上で気軽に子育ての相談ができるアプリケーションを作成しました。

# 使用技術
## フロントエンド  
HTML / CSS / Sass

## バックエンド  
Ruby 2.5.3  
Rails 5.2.6   
carrierwave (画像のアップロード)  
mini_magick (画像のサイズ変更)  
devise (ログイン)  
dotenv-rails (環境変数の管理)  
rspec-rails (テストフレームワーク)  
factory_bot_rails (テストデータの作成)  
capybara (E2Eテスト)  
simplecov (カバレッジの測定)  
bullet (N+1問題の解決)  
rubocop (静的コード解析)  
fog-aws (S3)  

## 開発環境  
Docker 20.10.6  
DockerCompose 1.29.1  

## 本番環境  
AWS(IAM、VPC、EC2、RDS 、S3、ACM、ALB、Route53)  
Nginx 1.20.0  
Puma 3.12.6  
Mysql 5.7.33  

## バージョン管理  
Git 2.30.1   

## その他使用ツール  
Visual Studio Code  
draw.io

# ER図
![er完成](https://user-images.githubusercontent.com/70546620/125633776-84105aac-c3c8-4925-90fe-2cc709abf19d.png)

# インフラ構成図
![aws完成](https://user-images.githubusercontent.com/70546620/125633952-d6ce3603-eaeb-4f1f-b072-d33ca9f41248.png)

# 機能一覧
## 相談、回答関連
相談投稿機能  
![相談投稿](https://user-images.githubusercontent.com/70546620/126039688-b7b6ca78-1ab6-4cd9-8afb-414679fcec7b.gif)

回答投稿機能  
![回答投稿](https://user-images.githubusercontent.com/70546620/126039690-9df1b3a4-fe7f-4ece-90ec-2e5156fc75d7.gif)

一覧機能  
詳細表示機能  
![詳細](https://user-images.githubusercontent.com/70546620/126039827-590f537b-96e7-415d-8cf5-7ae523045fba.gif)

削除機能  
キーワード検索機能  
いいね機能  
![いいね機能](https://user-images.githubusercontent.com/70546620/126039835-58d34911-39e7-4a10-81b3-c878b9106e0c.gif)


## プロフィール関連
ユーザー登録機能  
ログイン機能  
プロフィール編集機能  
