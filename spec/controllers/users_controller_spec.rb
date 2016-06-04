require 'rails_helper'
require 'support/factory_girl'
require_relative '../support/new_user.rb'


RSpec.describe UsersController, type: :controller do

describe "authenticated user" do
	    let(:user) {FactoryGirl.create(:user)}
    before do
        @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in(user)
 end
         describe "GET index" do
      it "redirects to index" do
        get :index
        expect(response).to render_template(:index)
end
end
    describe "GET show" do
      it "renders :show template for post" do
        get :show, id: user
        expect(response).to render_template(:show)
      end

      it "GETs the id of the post" do
        get :show, id: user
        expect(assigns(:user)).to eq(user)
      end
    end

end #authenticated user

  describe "unauthenticated user" do
    describe "GET index" do
      it "redirects to index" do
        get :index
        expect(response).to redirect_to(new_user_session_url)
      end
end
        describe "GET SHOW" do
            it "redirects to index" do
                      get :show
        expect(response).to redirect_to(new_user_session_url)
      end
end


end
end #rspec describe