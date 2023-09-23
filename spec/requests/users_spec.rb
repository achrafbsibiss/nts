require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:site) { create(:site) }
  let(:admin) { create(:user) }
  let(:user) { create(:user, site: site) }

  let(:valid_attributes)do
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
    context "employee access to his colleagues list" do
      it "renders a successful response" do
        sign_in user
        get users_path
      end
    end
  end

  before do
    sign_in user
  end

  describe "GET /show" do
    it "renders a successful response" do
      get "/users/#{user.id}"
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get "/users/new"
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get "/users/#{user.id}/edit"
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context 'Email validations' do
      it 'validates the format of email' do
        expect(user).to be_valid

        user.email = 'invalid_email'
        expect(user).to_not be_valid
      end
    end

    context "with valid parameters" do
      it "creates a new user" do
        post "/users", params: { user: valid_attributes }
        expect(User.count).to change { User.count }.by(1)
      end

      it "redirects to the created User" do
        post "/users/new", params: {user: valid_attributes}
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post "/users", params: {user: invalid_attributes}
        }.to change(User, :count).by(0)
      end
    end
  end
end
