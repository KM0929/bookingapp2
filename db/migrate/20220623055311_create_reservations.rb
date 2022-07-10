class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :reservation_id
      t.date :reservation_start
      t.date :reservation_end
      t.integer :reservation_people

      t.timestamps
    end
  end
end
