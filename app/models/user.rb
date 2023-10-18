class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar, dependent: :destroy
  has_one :role, dependent: :destroy
  has_many :site_users, class_name: 'Siteuser'
  has_many :site, through: :site_users


  validates :first_name, :last_name, :gender, :birthdate,
    :cin, :nationality, :gender, presence: true

  enum gender: { male: 0, female: 1, other: 2 }


  def self.ransackable_attributes(auth_object = nil)
    ["first_name", "last_name", "cin", "job_title", "email"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["avatar_attachment", "avatar_blob", "role", "site"]
  end

  def has_role?(role_name)
    role&.name == role_name.to_s
  end

  def avatar_url_or_default
    if avatar.attached?
      Rails.application.routes.url_helpers.rails_blob_url(
        avatar, only_path: true
      )
    else
      "users/user.png"
    end
  end 

  def full_name(first_name_first: true)
    first_name_first ? "#{first_name} #{last_name}" : "#{last_name} #{first_name}"
  end
  
end
