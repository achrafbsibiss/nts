class Role < ApplicationRecord
  
  belongs_to :user
  validates :name, presence: true

  enum name: {
    admin: 1,
    field_agent: 2,
    project_manager: 3,
    project_director: 4,
  }
end
