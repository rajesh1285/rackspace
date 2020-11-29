class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.string :name
      t.string :website_url
      t.string :titile
      t.text :description
      t.references :user, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
