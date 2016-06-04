require 'rails_helper'
require 'support/factory_girl'
require_relative '../support/new_user.rb'
require 'factory_girl_rails'
  include Devise::Controllers::Helpers

RSpec.describe PostsController, type: :controller do

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
    describe "GET new" do
      it "renders :new template" do
        get :new
        expect(response).to render_template(:new)
      end

      it "assigns new Achievement to @achievement" do
        get :new
        expect(assigns(:post)).to be_a_new(Post)
      end
    end
    describe "GET show" do
      let(:post) { FactoryGirl.create(:post, user: user)}

      it "renders :show template for post" do
        get :show, id: post
        expect(response).to render_template(:show)
      end

      it "GETs the id of the post" do
        get :show, id: post
        expect(assigns(:post)).to eq(post)
      end
    end

      describe "POST create" do
      let(:valid_data) { FactoryGirl.attributes_for(:post) }

      context "valid data" do
        it "redirects to achievements#show" do
          post :create, post: valid_data
          expect(response).to redirect_to(post_path(assigns[:post]))
        end
        it "creates new achievement in database" do
          expect {
            post :create, post: valid_data
          }.to change(Post, :count).by(1)      
           end
      end
      end
           let(:posted) { FactoryGirl.create(:post, user: user) }
            describe "GET edit" do
        it "renders :edit template" do
          get :edit, id: posted
          expect(response).to render_template(:edit)
        end

        it "assigns the requested achievement to template" do
          get :edit, id: posted
          expect(assigns(:post)).to eq(posted)
        end
      end
          context "is the owner of the achievement" do
      describe "GET edit" do
        it "renders edit" do
          get :edit, id: posted
          expect(response).to render_template("edit")
        end
      end
      end


end #end of auth
end #end of authenticated valids
=begin
       describe "GET new" do
      it "renders :new template" do
        get :new
        expect(response).to render_template(:new)
      end
  end
    describe "GET show" do
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

=end