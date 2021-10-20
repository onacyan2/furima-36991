## usersテーブル

|Column           |Type    |Options                         |
|-----------------|--------|--------------------------------|
| nickname        | string | null: false                    |
| email           | string | null: false, foreign_key: true |
| password        | string | null: false                    |
| last-name       | string | null: false                    |
| first-name      | string | null: false                    |
| last-name-kana  | string | null: false                    |
| first-name-kana | string | null: false                    |
| birth-date      | string | null: false                    |

### Association
- has_many :items
- has_many :order_items


## itemsテーブル

|Column               |Type        |Options                         |
|---------------------|------------|--------------------------------|
| name                | string     | null: false                    |
| info                | text       | null: false                    |
| category            | string     | null: false                    |
| sales-status        | string     | null: false                    |
| shipping-fee-status | string     | null: false                    |
| prefecture          | string     | null: false                    |
| scheduled-delivery  | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has _one :order_item
- has_one :order, through: :order_item


## ordersテーブル

|Column        |Type     |Options      |
|--------------|---------|-------------|
| charge-form  | string  | null: false |
| postal-code  | string  | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| addresses    | string  | null: false |
| building     | string  |             |
| phone-number | integer | null: false |

### Association
- belongs_to :order_item
- belongs_to :item, though: :order_item


## order_itemsテーブル

|Column |Type        |Options                         |
|-------|------------|--------------------------------|
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |
| order | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :order