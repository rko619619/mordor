class AddImageToCompositions < ActiveRecord::Migration[6.0]
  def change
    add_column :compositions, :image, :string
  end
end
