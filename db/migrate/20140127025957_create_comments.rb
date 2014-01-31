class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.timestamps
      t.string :author, null: false
      t.text :body, null: false
      t.integer :commentable_id
      t.string :commentable_type
    end
  end
end
