require 'rails_helper'

RSpec.describe LandingPagesController, type: :controller do

  describe "GET #welcome" do
    it "returns http success" do
      get :welcome
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #landlord" do
    it "returns http success" do
      get :landlord
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #tenant" do
    it "returns http success" do
      get :tenant
      expect(response).to have_http_status(:success)
    end
  end

end
