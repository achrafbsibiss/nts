class Site < ApplicationRecord
  has_many :site_users, class_name: 'Siteuser'
  has_many :users, through: :site_users
  has_rich_text :description
  has_many :equipment

  validates :name, :city, :adresse, :phone, presence: true
  
  def self.ransackable_attributes(auth_object = nil)
    ["name", "adresse", "city", "phone", "description"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["equipment", "rich_text_description", "users"]
  end
end
