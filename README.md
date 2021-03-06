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
| birth_day          | date    | null: false               |

### Association
- has_many :items
- has_many :logs
- has_many :comments
- has_many :contacts



## itemsテーブル

|  Column      |   Type     |  Options          |
|--------------|------------|-------------------|
| name         | string     | null: false       |
| text         | text       | null: false       |
| user         | references | foreign_key: true |
| genre_id     | integer    | null: false       |
| status_id    | integer    | null: false       |
| charge_id    | integer    | null: false       |
| prefecture_id| integer    | null: false       |
| days_id      | integer    | null: false       |
| price        | integer    | null: false       |

### Association
- belongs_to :user
- has_one    :log
- has_many   :comments



## logsテーブル

|  Column   |   Type     |  Options                       |
|-----------|------------|--------------------------------|
| user      | references | foreign_key: true              |
| item      | references | foreign_key: true              |

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
| building_name | string     |                                |
| tell          | string     | null: false                    |
| log           | references | foreign_key: true              |

### Association
- belongs_to :log



## commentsテーブル

|  Column      |   Type     |  Options          |
|--------------|------------|-------------------|
| user         | references | foreign_key: true |
| item         | references | foreign_key: true |
| comment      | string     | null: false       |

### Association
- belongs_to :user
- belongs_to :item



## contactsテーブル

|  Column   |   Type     | Options |
|-----------|------------|---------|
| name      | string     |         |
| email     | string     |         |
| message   | text       |         |

