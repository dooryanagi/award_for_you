class CreateApplauses < ActiveRecord::Migration[6.1]
  def change
    create_table :applauses do |t|

      t.integer :user_id, null: false
      t.integer :award_id, null: false

      t.timestamps
    end
  end
end
