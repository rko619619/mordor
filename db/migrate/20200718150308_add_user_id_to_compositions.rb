class AddUserIdToCompositions < ActiveRecord::Migration[6.0]
  def change
    add_column :compositions, :user_id, :integer
  end
end
