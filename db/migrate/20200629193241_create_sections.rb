class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.belongs_to :composition
      t.string :name
      t.text :text
      t.timestamps
    end
  end
end
