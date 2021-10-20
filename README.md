## usersテーブル

|Column              |Type    |Options                         |
|--------------------|--------|--------------------------------|
| nickname           | string | null: false                    |
| email              | string | null: false, foreign_key: true |
| encrypted_password | string | null: false                    |
| last-name          | string | null: false                    |
| first-name         | string | null: false                    |
| last-name-kana     | string | null: false                    |
| first-name-kana    | string | null: false                    |
| birth-date         | date   | null: false                    |

### Association
- has_many :items
- has_many :user_items


## itemsテーブル

|Column               |Type        |Options                         |
|---------------------|------------|--------------------------------|
| name                | string     | null: false                    |
| info                | text       | null: false                    |
| category            | integer    | null: false                    |
| sales-status        | integer    | null: false                    |
| shipping-fee-status | integer    | null: false                    |
| prefecture          | integer    | null: false                    |
| scheduled-delivery  | integer    | null: false                    |
| price               | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :user_item


## ordersテーブル

|Column        |Type     |Options      |
|--------------|---------|-------------|
| postal-code  | string  | null: false |
| prefecture   | integer | null: false |
| city         | string  | null: false |
| addresses    | string  | null: false |
| building     | string  |             |
| phone-number | integer | null: false |

### Association
- belongs_to :user_item


## user_itemsテーブル

|Column    |Type        |Options                         |
|----------|------------|--------------------------------|
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |
| order_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :order