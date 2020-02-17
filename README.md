## freemarket_sample_66g
 
フリマアプリ「メルカリ」のクローンサイト。

![TOPページ](https://gyazo.com/da96e51a44910b73fef47f814747ab0d/raw)
<br>
<br>

## App URL

http://18.177.134.226/

##### Basic認証をかけています。ご覧の際は以下のIDとPassを入力してください。
 - Basic認証
    - ID:mercari
    - Pass:6666
    
### テストユーザー
 - 購入者用アカウント
    - メールアドレス:buyer@gmail.com
    - パスワード: buyer111
 - 購入用カード情報
    - 番号：4242424242424242
    - 期限：1月/21年
    - セキュリティコード：123
 - 出品者用アカウント
    - メールアドレス名: seller@gamil.com
    - パスワード:  seller111
<br>

## Description

フリマアプリ「メルカリ」のクローンサイトを作成しました。誰でも簡単に売り買いが楽しめるフリマアプリの機能を再現したページ。 ユーザー登録、商品出品、商品購入などの機能が再現されていますが、実際の取引はできません。4人チームでアジャイル開発を行いました。
<br>
<br>

## Features
 
- haml/scss記法と、命名規則BEMを使ったマークアップ
- ウィザード形式を用いたユーザー登録フォーム
- SNS認証による新規登録、ログイン(ローカル環境のみ)
- pay.jpによる商品購入処理
- 商品検索機能
- capistranoによるAWS EC2への自動デプロイ
- ActiveStorageを使用しAWS S3への画像アップロード
<br>

## Requirement

- Ruby 2.5.1
- Rails 5.0.7
<br>

## Usage

```
$ git clone https://github.com/WAKUZO/freemarket_sample_66g.git
$ cd freemarket_sample_66g
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
→ http://localhost:3000
```
<br>

## Author

@takaking216 @yuevo16 @jujuju0924 @WAKUZO
