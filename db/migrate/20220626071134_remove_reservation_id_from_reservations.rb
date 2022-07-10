class RemoveReservationIdFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :Reservation_id, :integer
  end
end
