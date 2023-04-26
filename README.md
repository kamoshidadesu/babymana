# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

##  usersテーブル

| Column             | Type   | Option                    |
| ------------------ | -------| ------------------------- |
| name               | string | null: false               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

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
| year_id            | integer    | null: false                    |
| month_id           | integer    | null: false                    |
| day_id             | integer    | null: false                    |
| hour_id            | integer    | null: false                    |
| minutes_id         | integer    | null: false                    |
| record_id          | string     | null: false                    |
| user               | references | null: false, foreign_key :true |

### Association

- belongs_to :user