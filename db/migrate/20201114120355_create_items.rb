class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,                  null: false
      t.text    :introduction ,         null: false
      t.integer :price,                 null: false
      t.integer :item_condition_id,     null: false
      t.integer :postage_payer_id,      null: false
      t.integer :prefecture_code_id,    null: false
      t.integer :item_purchase_id,      null: false
      t.integer :price_preservation_id, null: false
      t.integer :user_id,               null: false, foreign_key: true
    end
  end
end
