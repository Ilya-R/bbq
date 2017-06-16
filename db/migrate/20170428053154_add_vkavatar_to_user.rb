class AddVkavatarToUser < ActiveRecord::Migration
  def change
    add_column :users, :vkavatar, :string
  end
end
