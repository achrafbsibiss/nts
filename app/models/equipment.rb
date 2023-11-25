class Equipment < ApplicationRecord
  belongs_to :site
  has_one_attached :image

  ransacker :site_name_cont do |parent|
    Arel::Nodes::InfixOperation.new('||', parent.table[:site_name], Arel::Nodes.build_quoted(' '))
  end

  def self.ransackable_attributes(auth_object = nil)
    ["code", "equipment_type", "name", "port", "site_name_cont"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["site"]
  end
end
