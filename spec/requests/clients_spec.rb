require 'rails_helper'

RSpec.describe "Clients", type: :request do
  let(:user) { create(:user) }
  let(:admin) { create(:user) }
  let(:client) { create(:client) }
  
  let(:valid_attributes)do
    {
      name: "TOTO",
      responsible_name: "Ben Shanahan",
      responsible_email: "zachary@lynch-turner.test",
      phone: "501-888-4222 x310",
      adress: "2335 Roberto Track, Rolfsonton, CA 73494-9474",
      city: "Astana",
      code_postal: "39448"
    }
  end

  let(:invalid_attributes)do
    {
      name: "TOTO",
      responsible_name: "",
      responsible_email: "zachary@lynch-turner.test",
      phone: "",
      adress: "",
      city: "Astana",
      code_postal: "39448"
    }
  end

  before do
    Role.create!(user_id: user.id, name: :admin)
    sign_in user
  end

  describe "GET /index" do
    context "The user access to clients list" do
      it "renders asucceful response" do
        get clients_path
      end
    end
  end

  describe "GET/new" do
    it "renders the successful response"do
      get new_client_path
      expect(response).to be_successful
    end
  end

  describe "POST /create"do
    context "When the Clients is succesfully created" do
      before do
        post clients_path, params: {client: valid_attributes}
      end

      it 'creates a new announcement' do
        expect(Client.count).to eq(1)
      end
    end

    context "When the Clients is succesfully created" do
      before do
        post clients_path, params: {client: invalid_attributes}
      end

      it 'creates a new announcement' do
        expect(Client.count).to eq(0)
      end

      it 'returns an unprocessable entity status' do
        expect(response)
      end
    end
  end
end
