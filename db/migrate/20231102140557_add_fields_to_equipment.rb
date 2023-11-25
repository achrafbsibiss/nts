class AddFieldsToEquipment < ActiveRecord::Migration[7.0]
  def change
    add_column :equipment, :number_of_ports, :integer
    add_column :equipment, :port_statuses, :jsonb
  end
end
