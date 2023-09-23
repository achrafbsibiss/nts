class Site < ApplicationRecord
  has_many :users, dependent: :nullify
  has_rich_text :description

  validates :name, :city, :adresse, :phone, presence: true
end
