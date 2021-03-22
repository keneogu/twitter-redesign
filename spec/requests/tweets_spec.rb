require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/tweets/index"
      expect(response).to have_http_status(:success)
    end
  end

end
