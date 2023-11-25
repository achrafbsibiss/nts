class Equipment < ApplicationRecord
  # validates :equipment_type, inclusion: { in: ["fibre", "optical fiber"], message: "must be fibre or optical fiber" }
  validates :name, :equipment_type, :code, :site_id, presence: true
  validate :validate_number_of_ports, if: :requires_port_validation?
  validate :port_statuses, if: :requires_port_validation?

  belongs_to :site
  has_one_attached :image, dependent: :destroy


  def self.ransackable_attributes(auth_object = nil)
    ["code", "equipment_type", "name", "port", "site_name_cont"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["site"]
  end


  private

  def requires_port_validation?
    equipment_type == "fibre"
  end

  def validate_number_of_ports
    if number_of_ports.nil? || !number_of_ports.between?(1, 64)
      errors.add(:number_of_ports, 'must be between 1 and 64')
    end
  end
end
