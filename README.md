# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- .............................

<!-- FIXME: after devise -->

# DB 設計

# tweet DB 設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |
| nickname | string | null: false |

### Association

- has_many :tweets
- has_many :comments

## tweets テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| image   | text    |                                |
| text    | text    |                                |
| user_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| text     | text    | null: false                    |
| user_id  | integer | null: false, foreign_key: true |
| tweet_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :tweet
- belongs_to :user

<!-- FIXME:Qiita参考 -->

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |
| username | string | null: false |

### Association

- has_many :posts
- has_many :comments

## posts テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| title   | text    | null: false                    |
| text    | text    | null: false                    |
| user_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :posts_tags
- has_many :tags, through: :posts_tags

## tags テーブル

| Column | Type | Options     |
| ------ | ---- | ----------- |
| text   | text | null: false |

### Association

- has_many :posts_tags
- has_many :posts, through: :posts_tags

## posts_tags テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| post_id | integer | null: false, foreign_key: true |
| tag_id  | integer | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :tag

## comments テーブル

| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| text     | text    | null: false                    |
| user_id  | integer | null: false, foreign_key: true |
| group_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user
