class AddCreatedatToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :api_created_at, :string
  end
end
