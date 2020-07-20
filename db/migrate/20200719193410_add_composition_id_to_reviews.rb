class AddCompositionIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :composition_id, :integer
  end
end
