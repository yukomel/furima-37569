# DB 設計

# users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email	             | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_day          | date                | null: false               |

### Association

- has_many :products
- has_many :orders


## orders table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| product     | references | null: false, foreign_key: true |

### Association

- belong_to :user
- belongs_to :product
- has_one :address


## products table

| Column                   | Type       | Options                        |
|--------------------------|------------|--------------------------------|
| name                     | string     | null: false                    |
| description	             | text       | null: false                    |
| category_id              | integer    | null: false                    |
| status_id                | integer    | null: false                    |
| shopping_cost_id         | integer    | null: false                    |
| prefecture_id            | integer    | null: false                    |
| shopping_day_id          | integer    | null: false                    |
| price                    | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## addresses table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| code               | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone              | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order