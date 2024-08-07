class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|

      t.integer :user_id, null: false
      t.integer :grand_prize_id, null: false
      t.text :comment, null: false
      t.string :character, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
