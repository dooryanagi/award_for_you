class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.date :birthday, null: false

      t.timestamps
    end
  end
end
