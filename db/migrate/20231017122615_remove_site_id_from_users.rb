class RemoveSiteIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :site_id, :integer
  end
end
