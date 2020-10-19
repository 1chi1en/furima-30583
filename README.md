# テーブル設計

## users テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| nickname     | string  | null: false |
| email        | string  | null: false |
| password     | string  | null: false |
| last_name    | string  | null: false |
| first_name   | string  | null: false |
| k_last_name  | string  | null: false |
| k_first_name | string  | null: false |
| year         | integer | null: false |
| month        | integer | null: false |
| day          | integer | null: false |

### Association

- has_many :items
- has_many :comment
- has_many :buys


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| details      | string     | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| shipping     | string     | null: false                    |
| area         | string     | null: false                    |
| shipping_day | string     | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- has_many :comment
- has_many :buy


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | string     | null: false                    |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

## buys テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| address    | string     | null: false                    |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |