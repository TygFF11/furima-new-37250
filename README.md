# README

1. デプロイ
2. Basic認証
3. データベース設計
4. ユーザー管理機能
5. 商品出品機能
6. 商品一覧表示機能
7. 商品詳細表示機能
8. 商品情報編集機能
9. 商品削除機能
10. 商品購入機能
11. S3の導入

<!-- 1日目：テーブル設計  済 -->
<!-- 2 - 4日目：ユーザー管理機能  済 -->
<!-- 5 - 8日目：商品出品機能  済 -->
<!-- 9日目 -->
<!-- ->商品一覧  -->
<!-- & 商品詳細  -->
<!-- & 商品情報編集  -->
<!-- & 商品削除機能 -->
10日 - 15日目
商品購入機能 
& Basic認証 
& S3
16日：デプロイ

# users(ユーザー管理)
| column                | type       | option                         |
| --------------------- | ---------- | ------------------------------ |
| nickname              | string     | null: false                    |
| email                 | string     | null: false, unique: true      |
| encrypted_password    | string     | null: false                    |
| first_name            | string     | null: false                    |
| last_name             | string     | null: false                    |
| first_name_kana       | string     | null: false                    |
| last_name_kana        | string     | null: false                    |
| birthday              | date       | null: false                    |

- user has_many :items
- user has_many :orders


# items(商品管理)
| column         | type       | option                         |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item_name      | string     | null: false                    |
| item_describe  | text       | null: false                    |
| item_price     | integer    | null: false                    |
| category_id    | integer    | null: false                    |
| situation_id   | integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| delivery_id    | integer    | null: false                    |
| day_id         | integer    | null: false                    |

- item belongs_to :user
- item has_one :order


# orders(販売情報管理)
| column         | type       | option                         |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

- belongs_to item
- belongs_to user
- has_one address


# addresses(配送先情報)
| ------------------ | ---------- | ------------------------------ |
| order              | references | null: false, foreign_key: true |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| urban_town_village | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     | null: false                    |
| phone_number       | string     | null: false                    |

- belongs_to order

