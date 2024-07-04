class CreateApplauses < ActiveRecord::Migration[6.1]
  def change
    create_table :applauses do |t|

      t.timestamps
    end
  end
end
