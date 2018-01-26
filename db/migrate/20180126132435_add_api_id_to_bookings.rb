class AddApiIdToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :api_booking_id, :integer
  end
end
