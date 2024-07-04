class CreateAwards < ActiveRecord::Migration[6.1]
  def change
    create_table :awards do |t|

      t.integer :user_id, null: false
      t.text :comment, null: false
      t.boolean :is_public, null: false, default: true
      
      t.timestamps
    end
  end
end