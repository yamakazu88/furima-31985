require 'rails_helper'

RSpec.describe "Contacts", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/contacts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /confirm" do
    it "returns http success" do
      get "/contacts/confirm"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /thanks" do
    it "returns http success" do
      get "/contacts/thanks"
      expect(response).to have_http_status(:success)
    end
  end

end
