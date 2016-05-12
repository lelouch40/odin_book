class OauthController < ApplicationController
  def create
  	raise request.env["omniauth.auth"].to_yaml
  end

  def destroy
    session[:user_id] = nil
    redirect_to(:controller=>"post",:action=>"index")
 end
end