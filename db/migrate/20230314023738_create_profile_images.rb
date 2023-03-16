class CreateProfileImages < ActiveRecord::Migration[6.1]
  def change
    create_table :profile_images do |t|
      t.string :user_name
      t.text :introduction
      t.integer:user_id

      t.timestamps
    end
  end
end
