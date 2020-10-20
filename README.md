# テーブル設計

## users テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| nickname        | string     | null: false                    |
| email           | string     | null: false                    |
| password        | string     | null: false                    |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| kana_last_name  | string     | null: false                    |
| kana_first_name | string     | null: false                    |
| birth           | date       | null: false                    |
| buyer           | references | null: false, foreign_key: true |

### Association

- belongs_to :buyers
- has_one :purchases
- has_many :items
- has_many :comment

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| details         | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| shipping_id     | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_one :purchases
- belongs_to :user


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| purchase  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase

## buyers テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| post_code  | integer    | null: false                    |
| pref_id    | integer    | null: false                    |
| town       | string     | null: false                    |
| address    | string     | null: false                    |
| residence  | text       | null: false                    |
| phone      | integer    | null: false                    |

### Association

- has_many :users
- has_one :purchase

## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- has_one :buyer
- has_one :user
- has_one :item
- has_many :comments