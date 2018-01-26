class AddApiIdToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :api_room_id, :integer
  end
end
