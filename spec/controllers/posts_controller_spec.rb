require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "authenticated user" do
    before do
      sign_in
    end
    describe "GET index" do
      it "renders :index template" do
        get :index
        expect(response).to render_template(:index)
      end
  end
       describe "GET new" do
      it "renders :new template" do
        get :new
        expect(response).to render_template(:new)
      end
  end
    describe "GET show" do
                private_post = FactoryGirl.create(:private_post)

      let(:post) { FactoryGirl.create(:private_post)}
            it "renders :show template" do
        get :show, id: post
        expect(response).to render_template(:show)
      end
      it "assigns requested post to @post" do
        get :show, id: post
        expect(assigns(:post)).to eq(post)
      end
    end
end
  describe "unauthenticated user" do
    describe "GET index" do
      it "redirects to index" do
        get :index
        expect(response).to redirect_to(new_user_session_url)
      end
end
    describe "GET new" do
            it "redirects to index" do
              get :new
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
end
