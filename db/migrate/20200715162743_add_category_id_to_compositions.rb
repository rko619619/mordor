class AddCategoryIdToCompositions < ActiveRecord::Migration[6.0]
  def change
    add_column :compositions, :category_id, :integer
    add_index :compositions, :category_id
  end
end
