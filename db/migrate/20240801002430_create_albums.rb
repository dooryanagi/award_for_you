class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.integer :user_id, null: false
      t.integer :grand_prize_id, null: false
      t.integer :child_id, null: false
      t.integer :event_id, null: false

      t.timestamps
    end
  end
end
