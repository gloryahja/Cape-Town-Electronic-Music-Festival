class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :bio
      t.string :avatar
      t.string :cover_photo
      t.string :facebook
      t.string :twitter
      t.string :soundcloud

      t.timestamps null: false
    end
  end
end
