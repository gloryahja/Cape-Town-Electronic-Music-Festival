class AddProfileTokenToPicture < ActiveRecord::Migration
  def change
  	add_column :pictures, :profile_token, :string
  end
end
