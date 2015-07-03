class AddEmbedToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :embed, :string
  end
end
