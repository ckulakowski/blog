class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.timestamps 
      t.text :body, null: false
      t.string :title, null: false
    end
  end
end
