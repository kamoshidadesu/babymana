# BABY MANA
# アプリケーション概要
* 赤ちゃんの成長を記録や管理をし、育児をサポートすることができます。
* 子育てをする親の気持ちを少しでも前向きにするためのアプリケーションです。
# URL
* https://babymana.onrender.com
# テスト用アカウント
* Basic認証ID: admin
* Basic認証パスワード: 2222
* メールアドレス: test@test.com
* パスワード: test1111
# 利用方法
## カレンダー機能
1.トップページ（一覧ページ）のヘッダーからユーザー新規登録を行います

2.カレンダーの日付けの部分をクリックすると予定投稿ページへ遷移します

3.投稿画面にて予定（予定、日時（開始）（終了）、内容）を入力し投稿します

4.トップページのカレンダー内に表示されている投稿内容をクリックすると詳細画面へ遷移します

5.詳細画面にて編集ボタンと削除ボタンがあり、それぞれの機能に遷移します

6.削除ボタンを押した場合には予定は削除されます

7.編集ページでは表示されている内容を変更し、保存ボタンを押すと編集できます

## 日記機能
1.トップページのヘッダーから「日記」を押すと日記投稿ページに遷移します

2.投稿画面にて日記（日にち、嬉しかったこと、日記、写真）を入力し投稿します

3.日記投稿ページのカレンダー内に表示されている日記アイコンをクリックすると詳細ページに遷移します

4.詳細画面にて編集ボタンと削除ボタンがあり、それぞれの機能に遷移します

5.削除ボタンを押した場合には予定は削除されます

6.編集ページでは表示されている内容を変更し、保存ボタンを押すと編集できます

## マネジメント機能
1.トップページのヘッダーから「記録」を押すと記録投稿ページに遷移します

2.投稿画面にて記録（日時、プルダウンから選択、備考）を入力し投稿します

3.記録投稿ページのカレンダー内に表示されている記録アイコンをクリックすると詳細ページに遷移します

4.詳細画面にて編集ボタンと削除ボタンがあり、それぞれの機能に遷移します

5.削除ボタンを押した場合には予定は削除されます

6.編集ページでは表示されている内容を変更し、保存ボタンを押すと編集できます

# アプリケーションを作成した背景
私は一児の息子の父であります。息子が生まれて約２年、生まれてから今までの事を妻と話していた際に生まれてからの気持ちを聞きました。当時は私は仕事柄残業も多かったため、子育てはほぼワンオペになっていました。色々な要因で気持ちが落ち込むことが多いと言っておりました。
同様のことで悩んでいる親（男女かかわらず）は多いのではないかと思いました。そんな一人で落ち込んでしまっている時に少しでも前向きになれるようにしたいという思いから、日記に嬉しかった（良かったこと、褒めてあげたいこと）出来事を記入する機能をつけた、カレンダー、記録、日記を一つのアプリで子育てをサポートするアプリ、ベビーマネジメント「baby mana」を開発することにしました。

# 洗い出した要件
要件を定義したシート
https://docs.google.com/spreadsheets/d/1qWRjgatBOHQX7FAR_dTtmNhi9KUdqrQ2Z0BdDrw-Hlg/edit#gid=982722306

## 実装したい機能いついての画像やGIFおよびその説明

## 実装予定の機能
* カレンダー機能とマネジメント機能での詳細ページの表示の仕方
* マネジメント機能のプルダウン内の選択肢を画像表示にする
* お悩み相談機能（投稿機能とコメント機能をつける）

## データベース設計

[![Image from Gyazo](https://i.gyazo.com/826f736deccd0f30aec3a8d261cd744d.png)](https://gyazo.com/826f736deccd0f30aec3a8d261cd744d)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/3078e75ac3f659ee42dd8409356544a2.png)](https://gyazo.com/3078e75ac3f659ee42dd8409356544a2)

# 開発環境
* フロントエンド: HTML,CSS
* バックエンド: Ruby
* インフラ :Render
* テキストエディタ:vscode
* タスク管理 :Github

# 工夫したポイント


# テーブル設計

##  usersテーブル

| Column             | Type    | Option                    |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| gender_id          | integer | null: false               |

### Association

- has_many :calendars
- has_many :managements
- has_many :diaries

##  calendarsテーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| start_time         | datetime   | null: false                    |
| end_time           | datetime   | null: false                    |
| schedule           | string     | null: false                    |
| content            | string     |                                |
| user               | references | null: false, foreign_key :true |

### Association

- belongs_to :user

##  diariesテーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| start_time         | datetime   | null: false                    |
| happy              | string     | null: false                    |
| diary              | text       |                                |
| user               | references | null: false, foreign_key :true |

### Association

- belongs_to :user

##   managementsテーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| start_time         | datetime   | null: false                    |
| record_id          | integer    | null:false                    |
| note               | string     |                                |
| user               | references | null: false, foreign_key :true |

### Association

- belongs_to :user