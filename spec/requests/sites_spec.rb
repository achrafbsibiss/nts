require 'rails_helper'

RSpec.describe "Sites", type: :request do
  let(:user) { create(:user) }
  let(:site) { create(:site) }

  let(:valid_attributes) do
    {
      name: "Site1",
      city: "Qgqdir",
      phone: "(602) 496-4636",
      adresse: "411 N Central Ave, Phoenix, AZ 850"
    }
  end

  let(:invalid_attributes) do
    {
      name: "",
      city: "",
      phone: "(602) 496-4636",
      adresse: "411 N Central Ave, Phoenix, AZ 850"
    }
  end

  before do
    sign_in user
  end

  describe "GET /index" do
   it "returns a successful response" do
    get sites_path
    expect(response).to be_successful
   end
  end

  describe "GET /new" do
    it "returns a successful response" do
      get new_site_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_site_path(id: site.id)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with validat params" do
      it "create new site" do
       expect {
        post sites_path, params: {site: valid_attributes}
       }.to change(Site, :count).by(1)
      end
    end

    context "with invalidat params" do
      it "create new site" do
       expect {
        post sites_path, params: {site: invalid_attributes}
       }.to change(Site, :count).by(0)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      before do
        patch site_url(id: site.id), params: {site: valid_attributes}
      end

      it "updates the requested site" do
        site.reload
        expect(site.name).to eq("Site1")
        expect(site.city).to eq("Qgqdir")
        expect(site.adresse).to eq("411 N Central Ave, Phoenix, AZ 850")
        expect(site.phone).to eq("(602) 496-4636")
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch site_url(id: site.id), params: {site: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroy the site' do
      site = create(:site) 
      expect {delete site_path(id: site.id)}.to change(Site, :count).by(-1) 
    end
  end
end
