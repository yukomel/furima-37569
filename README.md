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
- belongs_to :histories


## histories table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | integer    | null: false, foreign_key: true |
| products    | string     | null: false, foreign_key: true |

### Association

- has_many :products
- belongs_to :address


## products table

| Column                   | Type       | Options                        |
|--------------------------|------------|--------------------------------|
| name                     | string     | null: false                    |
| description	             | text       | null: false                    |
| category                 | string     | null: false                    |
| status                   | string     | null: false                    |
| shipping_cost            | string     | null: false                    |
| shipping_days	           | string     | null: false                    |
| price                    | integer    | null: false                    |
| user_id	                 | integer    | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :address
- belongs_to :histories


## address table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| post_code	         | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| address	           | string     | null: false                    |
| building_name	     | string     | null: false                    |
| phone_number       | string     | null: false                    |
| buyer_id           | integer    | null: false, foreign_key: true |

### Association

- has_many :products
- has_many :histories