# テーブル設計

## usersテーブル

|  Column            |  Type   |  Options                  |
|--------------------|---------|-------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_reading | string  | null: false               |
| last_name_reading  | string  | null: false               |
| birth_day          | integer | null: false               |


### Association
- has_many :items
- has_many :logs

## itemsテーブル

|  Column   |   Type     |  Options                       |
|-----------|------------|--------------------------------|
| name      | string     | null: false                    |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| genre     | integer    | null: false, foreign_key: true |
| status    | integer    | null: false, foreign_key: true |
| charge    | integer    | null: false, foreign_key: true |
| area      | integer    | null: false, foreign_key: true |
| days      | integer    | null: false, foreign_key: true |
| price     | integer    | null: false                    |

### Association
- belongs_to :user
- has_one    :log

## logsテーブル

|  Column   |   Type     |  Options                       |
|-----------|------------|--------------------------------|
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address

## addressesテーブル

|  Column       |  Type      |  Options                       |
|---------------|------------|--------------------------------|
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| tell          | string     | null: false                    |
| log           | references | null: false, foreign_key: true |

### Association
- belongs_to :log