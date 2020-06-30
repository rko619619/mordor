class CreateCompositions < ActiveRecord::Migration[6.0]
  def change
    create_table :compositions do |t|
      t.string :title
      t.text :photo
      t.text :description

      t.timestamps
    end
  end
end
