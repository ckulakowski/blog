class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.timestamps
      t.text :body
      t.integer :post_id
    end
  end
end
