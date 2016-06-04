require 'rails_helper'
require 'support/factory_girl'
require 'factory_girl_rails'


  describe "authenticated user" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in(user)
    end
    end

=begin
feature "Create kitten with factory gal" do
	scenario "Kitten with valid data factory gal" do
		kitten=FactoryGirl.create(:post, description: 'gal')
		visit("kittens/#{kitten.id}")
		expect(page).to have_content("gal")
end
end
=end