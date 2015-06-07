class CreatePostCategory < ActiveRecord::Migration
  def change
    create_table :post_category do |t|
      t.integer :post_id
      t.integer :category_id
    end
    add_index :post_category, :post_id
    add_index :post_category, :catgory_id
  end
end
