class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :city
      t.string :adresse
      t.string :phone

      t.timestamps
    end
  end
end
