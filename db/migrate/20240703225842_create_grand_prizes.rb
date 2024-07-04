class CreateGrandPrizes < ActiveRecord::Migration[6.1]
  def change
    create_table :grand_prizes do |t|

      t.timestamps
    end
  end
end
