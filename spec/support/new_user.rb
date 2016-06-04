require 'rails_helper'
require 'support/factory_girl'
  include Capybara::DSL
class NewUser

	def visit_page
		    visit("/")
       self
end

def fill_in_with(params={})
	       fill_in('Description', with: 'Excellent read')
           self
end
def login(params={})
	fill_in('Username', with: 'yang')
	fill_in('Password', with: 'test')
	self
	end
def login_button
		click_on("Log in")
		visit("/")
		self
	end
	def submit
		click_on("Create post")
		self

	end
	def error_submit
				click_on("submit")
		self
end
end