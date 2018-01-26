class AddUserToMotels < ActiveRecord::Migration[5.1]
  def change
    add_reference :motels, :user, foreign_key: true
  end
end
