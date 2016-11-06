FactoryGirl.define do
  factory :item do
    sequence(:name)  {|n|  "item name #{n}"}
    sequence(:price) {|n|  n.to_f }

    factory :item_with_category do
      category {create(:category)}
    end
  end

  factory :category do
    sequence(:name)  {|n|  "Category Name #{n}"}
  end

  factory :order do
    sequence(:total) {|n| n.to_f }
    sequence(:server_id) {|n| n }

    factory :order_with_server do
      server {create(:server)}
    end
  end

  factory :server do
    sequence(:name)  {|n|  "server name #{n}"}
    sequence(:username)  {|n|  "username_#{n}"}
    sequence(:password)  {|n|  "password_#{n}"}

    factory :admin do
      role 1
    end
  end
end
