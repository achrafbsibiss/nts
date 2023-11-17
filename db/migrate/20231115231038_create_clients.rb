class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :responsible_name
      t.string :responsible_email
      t.string :phone
      t.string :adress
      t.string :city
      t.string :code_postal

      t.timestamps
    end
  end
end
