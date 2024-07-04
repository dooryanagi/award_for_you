class CreatePraises < ActiveRecord::Migration[6.1]
  def change
    create_table :praises do |t|

      t.timestamps
    end
  end
end
