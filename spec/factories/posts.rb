FactoryGirl.define do
  factory :post do
    description "description"
    factory :public_post do
      privacy :public_access
    end

    factory :private_post do
    end
  end

end
