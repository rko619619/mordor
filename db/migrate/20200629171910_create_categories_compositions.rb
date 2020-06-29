class CreateCategoriesCompositions < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_compositions do |t|
      t.references :composition
      t.references :category
    end
  end
end
