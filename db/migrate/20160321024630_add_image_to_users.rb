class AddImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_user, :string
  end
end
