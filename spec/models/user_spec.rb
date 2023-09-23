require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "#has_role?" do
    let(:role) { create(:role, user: user, name: :admin) }

    it "returns true if the user has the role" do
      expect(user.has_role?(role.name)).to be_truthy
    end
  end

  describe "#full_name" do
    it "returns the full name, start with first name" do
      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
    end

    it "returns the full name, start with last name" do
      expect(user.full_name(first_name_first: false)).to eq("#{user.last_name} #{user.first_name}")
    end
  end
end
