require 'rails_helper'
require 'support/factory_girl'
require 'shoulda-matchers'

RSpec.describe Post, type: :model do

	describe 'validations' do
    it {should validate_presence_of :description}
	it {should belong_to(:user)}
	it {should have_many(:comments)}

  
	end

  end #end rspec descripe