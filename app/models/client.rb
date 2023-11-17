class Client < ApplicationRecord
  has_one_attached :logo, dependent: :destroy
  validates :name, :responsible_email, :responsible_name, 
            :phone, :code_postal, :city, :adress, presence: true

  def self.ransackable_attributes( auth_object = nil)
    ["name", "responsible_name", "responsible_email", "phone", "city", "adress", "code_postal"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["logo_attachment", "logo_blob"]
  end
end
