class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :screenname
      t.string :city
      t.date :birthday
      t.string :full_name

      t.timestamps
    end
  end
end
