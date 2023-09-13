class Role < ApplicationRecord
  belongs_to :user

  enum name: {
    admin: 1,
    field_agent: 2,
    project_manager: 3,
    project_director: 4,
  }

  # def self.roles_names_to_select(user)
  #   role_names = if user.has_role?(:admin)
  #     names
  #   elsif user.has_role?(:hrd)
  #     names.slice(:accountant_director, :hr, :accountant, :manager)
  #   elsif user.site&.hrs&.include?(user)
  #     names.slice(:accountant, :manager)
  #   else
  #     {}
  #   end
  #   role_names.keys.map { |name| [Role.human_enum_name(:name, name), name] }
  # end
end
