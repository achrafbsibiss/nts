require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:site) { create(:site) }

  let(:validat_attributes)do
    {
      first_name: "John",
      last_name: "Doe",
      email: "me@test.com",
      phone: "12345678",
      birthdate: "02-03-1998",
      gender: "male",
      site_id: site.id,
      cin: "ZWE452GH",
      job_title: "Acheteur"
    }
  end

  let(:invalid_attributes) do
    {
      first_name: "",
      last_name: "",
      phone: "",
      birthdate: ""
    }
  end
  before do
    Role.create!(user_id: user.id, name: :admin)
  end
  
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end
end
