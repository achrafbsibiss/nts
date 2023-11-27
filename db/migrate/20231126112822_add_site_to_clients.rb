class AddSiteToClients < ActiveRecord::Migration[7.0]
  def change
    add_reference :clients, :site, null: false, foreign_key: true
  end
end
