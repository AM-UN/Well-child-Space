# Well-child-Space
#### 子育てに悩みを抱えている人がインターネット上で気軽に相談できるQ＆Aサイトです。<br><br>
![一覧 (2)](https://user-images.githubusercontent.com/70546620/126169408-4e4376e3-7e50-44b7-bca2-e5928818602c.gif)

### URL
https://www.well-child-space.com/

### テストログインユーザー  
メールアドレス : wellchildspace@gmail.com  
パスワード : password

相談と回答の投稿を行ったり、"いいね"をつけるにはログインが必要ですが、相談と回答の閲覧はログインなしでできます。  
<br>

# 制作背景  
私は現在、オンラインスクールの講師としてアルバイトしています。  
スクールには、コロナ渦で学校に通えなくなってしまった子、人間関係に悩んでしまった子、なかなか勉強に興味がもてない子など、様々なバックグラウンドの子供たちが在籍しています。私は授業の最後やslackのメッセージなどでお母様方と接する機会があり、その中で子育ての大変さを感じる場面が多々ありました。  
<br>
例えば、なかなか学校に行きたがらないお子さんとの向き合い方や、仕事と子育ての両立、勉強をどのように教えていけばいいかなど、様々な悩みや不安を抱えている方が多くいるのを感じました。実際、ニュースでコロナ禍になってからママ友同士で悩み相談や情報交換する機会が減り、不安やストレスを必要以上に抱え、子供などに強く当たってしまう報告が増えていることを知りました。  
<br>
そこで、 
#### 子育てへの疑問や不安、ストレスを抱えた人たちがそれぞれの悩みを共有したり、情報交換できるプラットフォームがあることで、子育てをする人たちの負担を軽減することができるのではないか
と考えました。 
<br>
そのため今回、子育てに悩みを抱えた人たちがオンライン上で気軽に子育ての相談ができるアプリケーションを作成しました。  
<br>

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
<br>

# インフラ構成図
![aws完成](https://user-images.githubusercontent.com/70546620/125633952-d6ce3603-eaeb-4f1f-b072-d33ca9f41248.png)
<br>

# 工夫した点
#### ・issueとプルリクエストを活用してチーム開発を意識  
#### ・Docker、DockerComposeを用いた開発環境構築
#### ・AWSによるインフラ構築、ALBを経由し常時SSL通信を行っている  
#### ・bootstrapを使わず、独自にデザイン
#### ・N+1問題に取り組みパフォーマンスを意識
#### ・リバースプロキシとして本番環境にNginxの導入  
#### ・コードの品質向上のため、RSpec、Capybaraによるモデルの単体テスト、一連の動作のE2Eテスト    
<br>

# 機能一覧
#### 〇相談、回答関連  
・相談投稿機能(画像アップロード可)  
・回答投稿機能(画像アップロード可)  
・相談一覧機能(相談に対する最新の回答も表示)  
・相談の詳細表示機能  
・編集、削除機能  
・いいね機能  
・キーワード検索機能  
#### 〇プロフィール関連  
・ユーザー登録、ログイン機能  
・ユーザー編集機能(画像アップロード可)  
・ユーザー詳細機能  
## 相談、回答関連
#### ・相談投稿機能  
ログイン時に相談を投稿することができます。相談に画像を添付することができます。  
<br>
![相談投稿](https://user-images.githubusercontent.com/70546620/126169449-39057411-7db5-4058-96ba-d1556d796711.gif)

#### ・回答投稿機能  
ログイン時に回答を投稿することができます。回答に画像を添付することができます。  
<br>
![回答投稿2](https://user-images.githubusercontent.com/70546620/126170006-949460f6-4c4b-44d3-856a-f48af8cc8372.gif)

#### ・相談一覧機能  
トップページで相談(それに対する最新の回答)の一覧を見ることができます。  
<br>
![一覧 (2)](https://user-images.githubusercontent.com/70546620/126169408-4e4376e3-7e50-44b7-bca2-e5928818602c.gif)

#### ・相談の詳細表示機能
相談に対する全ての回答、相談と回答の投稿日時を見ることができます。また、"回答する"ボタンを押すことで、同ページ内の回答投稿フォームに移動することができます。  
<br>
![詳細](https://user-images.githubusercontent.com/70546620/126039827-590f537b-96e7-415d-8cf5-7ae523045fba.gif)

#### ・編集、削除機能  
ログイン時に相談の詳細ページから相談と回答の編集、削除ができます。(投稿者のみ)  
<br>

#### ・いいね機能  
ログイン時に相談の詳細ページで相談、回答にいいねをすることができます。  
<br>
![いいね機能](https://user-images.githubusercontent.com/70546620/126169481-8e5e405a-105f-4437-ba04-2d981c3a3707.gif)


#### ・キーワード検索機能
相談文に含まれているキーワードで相談を検索することができます。  
<br>
![キーワード検索 (1)](https://user-images.githubusercontent.com/70546620/126174082-761ed8bc-3508-442a-94da-0e8e8ec02ee9.gif)

## プロフィール関連
#### ・ユーザー登録、ログイン機能  
メールアドレスとパスワードでユーザーを登録、ログインすることができます。  
<br>
![新規登録 (1) (1)](https://user-images.githubusercontent.com/70546620/126169792-ed60f7da-d710-42d4-9579-a7c036d22597.gif)

#### ・ユーザー編集機能 
ログインしているユーザーのユーザー詳細ページから、ユーザーの編集(ニックネーム、アイコン、自己紹介文)、パスワードの編集をすることができます。  
<br>
![2d9o7-upr1l](https://user-images.githubusercontent.com/70546620/131850622-d7fda7d0-b02f-4a8a-9ef6-631000c19502.gif)

#### ・ユーザー詳細機能
ユーザーのニックネーム、アイコン、自己紹介文を見ることができます。また、そのユーザーの投稿した相談と回答、いいねした相談と回答の一覧を表示することができます。  
<br>
![ユーザー詳細 (1)](https://user-images.githubusercontent.com/70546620/126169824-9546e43a-8d0f-4850-96dc-d2cbe156cfdc.gif)
