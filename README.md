# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| kana_last_name  | string  | null: false |
| kana_first_name | string  | null: false |
| birth           | date    | null: false |

### Association

- has_many :items
- has_many :comment
- belongs_to :buys


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | text       | null: false                    |
| details      | text       | null: false                    |
| category     | integer    | null: false                    |
| condition    | integer    | null: false                    |
| shipping     | integer    | null: false                    |
| area         | integer    | null: false                    |
| shipping_day | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- has_many :comment
- has_many :buy
- belongs_to :user


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | string     | null: false                    |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :buy

## buyers テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| post       | integer    | null: false                    |
| pref       | integer    | null: false                    |
| town       | string     | null: false                    |
| address    | string     | null: false                    |
| residence  | text       | null: false                    |
| phone      | integer    | null: false                    |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- has_many :user
- has_one :item
- has_many :comment