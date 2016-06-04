# RSpec
# spec/support/factory_girl.rb
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

require 'factory_girl_rails'
FactoryGirl.define do
  factory :post do
    description "asdd"
    comment_id "1"
 
     factory :public_post do
    end
end
end
FactoryGirl.define do
  factory :user, :class=>User do
    username "Reinhard"
    password "test"
    email "ggg@ggg.com"
  end
end
