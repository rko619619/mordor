class AddImagesToCompositions < ActiveRecord::Migration[6.0]
  def change
    add_column :compositions, :images, :json
  end
end
