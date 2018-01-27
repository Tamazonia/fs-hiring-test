class AddEarningsToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :amount_centavos_earned, :integer
  end
end
