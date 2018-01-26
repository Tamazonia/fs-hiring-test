class AddApiIdToMotels < ActiveRecord::Migration[5.1]
  def change
    add_column :motels, :api_motel_id, :integer
  end
end
