require 'rails_helper'
require 'support/factory_girl'
require 'shoulda-matchers'	
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
RSpec.describe User, type: :model do

	describe 'validations' do
	it {should have_many(:posts)}
		it {should have_many(:galleries).dependent(:destroy)}
				it {should have_many(:photos)}
end
describe 'follower' do
		user1=FactoryGirl.create(:user,username: "Yang", email: "yang@fuckthis.com", password: 'test')
	user2=FactoryGirl.create(:user,username: "Reinhard", email: "konev@sickofthis.com", password: 'test')
	it "increases followers to the followed" do
	  expect {
     user2.follow(user1)
          }

          end
                    it{should user2.following?(user1)}

                                                   DatabaseCleaner.clean
           end
end
=begin
	          expect {
     user1.follow(user2)
          }.to change(user2.followers, :count).by(1)

          
               expect{
               	user1.unfollow(user2)
               }.to change(user2.followers, :count).by(-1) 
=end
