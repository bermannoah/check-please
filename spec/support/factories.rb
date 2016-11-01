FactoryGirl.define do
  factory :item do
    sequence(:name)  {|n|  "item name #{n}"}
    sequence(:price) {|n|  n.to_f }

    factory :item_with_category do
      category {create(:category)}
    end
  end

  factory :category do
    sequence(:name)  {|n|  "category name #{n}"}
  end
end
