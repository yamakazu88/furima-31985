# テーブル設計

## usersテーブル

|  Column    |  Type   |  Options                  |
|------------|---------|-------------------------- |
| nickname   | string  | null: false               |
| email      | string  | null: false, unique: true |
| password   | string  | null: false               |
| first_name | string  | null: false               |
| last_name  | string  | null: false               |
| birth_day  | integer | null: false               |


### Association
- has_many :items
- has_many :logs

## itemsテーブル

|  Column   |   Type     |  Options                       |
|-----------|------------|--------------------------------|
| image     | string     | null: false                    |
| name      | string     | null: false                    |
| text      | text       | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| genre_id  | references | null: false, foreign_key: true |
| status_id | references | null: false, foreign_key: true |
| charge_id | references | null: false, foreign_key: true |
| area_id   | references | null: false, foreign_key: true |
| days_id   | references | null: false, foreign_key: true |
| price     | integer    | null: false                    |

### Association
- belongs_to :user
- has_one    :logs

## logsテーブル

|  Column   |   Type     |  Options                       |
|-----------|------------|--------------------------------|
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :items
- has_one    :addresses

## addressesテーブル

|  Column      |  Type   |  Options    |
|--------------|---------|------------ |
| number       | integer | null: false |
| prefectures  | string  | null: false |
| municipality | string  | null: false |
| address      | string  | null: false |
| tell         | integer | null: false |


### Association
- belongs_to :logs