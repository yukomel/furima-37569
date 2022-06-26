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
- has_many :histories


## histories table

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
| category_id              | integer    | null: false, foreign_key: true |
| status_id                | integer    | null: false, foreign_key: true |
| shopping_cost_id         | integer    | null: false, foreign_key: true |
| prefecture_id            | integer    | null: false, foreign_key: true |
| shopping_day_id          | integer    | null: false, foreign_key: true |
| price                    | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :history


## addresses table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| post_code	         | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name	     | string     |                                |
| phone_number       | string     | null: false                    |
| history            | references | null: false, foreign_key: true |

### Association

- belongs_to :history