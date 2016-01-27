class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.boolean :published
      t.boolean :featured

      t.timestamps null: false
    end
  end
end
