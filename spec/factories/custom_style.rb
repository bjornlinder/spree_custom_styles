FactoryBot.define do
  factory :custom_style, class: Spree::CustomStyle do
    sequence(:name) { |n| "Product ##{n} - #{Kernel.rand(9999)}" }
    description { generate(:random_description) }

    master_product { |p| p.association(:master_product) }
  end
end
