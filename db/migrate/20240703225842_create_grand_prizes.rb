class CreateGrandPrizes < ActiveRecord::Migration[6.1]
  def change
    create_table :grand_prizes do |t|

      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :owner_id, null: false
      t.integer :keyword_1, null: false, default: 0
      t.string :keyword_2
      t.string :keyword_3

      t.timestamps
    end
  end
end
