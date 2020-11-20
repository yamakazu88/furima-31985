class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,          null: false
      t.text       :text,          null: false
      t.references :user,          foreign_key: true
      t.integer    :genre_id,      null: false
      t.integer    :status_id,     null: false
      t.integer    :charge_id,     null: false
      t.integer    :prefecture_id, null: false
      t.integer    :days_id,       null: false
      t.integer    :price,         null: false
      t.timestamps
    end
  end
end
