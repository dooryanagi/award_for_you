class CreateWaitingEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :waiting_events do |t|

      t.timestamps
    end
  end
end
