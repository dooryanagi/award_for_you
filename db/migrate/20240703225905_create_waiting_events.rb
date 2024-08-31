class CreateWaitingEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :waiting_events do |t|

      t.integer :user_id, null: false
      t.integer :grand_prize_id, null: false
      t.text :comment, null: false
      t.string :character
      t.date :date

      t.timestamps
    end
  end
end
