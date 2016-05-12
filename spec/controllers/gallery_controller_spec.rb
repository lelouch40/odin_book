require 'rails_helper'

RSpec.describe GalleryController, type: :controller do

  describe "GET #scaffold" do
    it "returns http success" do
      get :scaffold
      expect(response).to have_http_status(:success)
    end
  end

end
