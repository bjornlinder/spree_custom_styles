# Would use base_product factory, but get error "unknown attribute 'deleted_at' for Spree::Price."
FactoryGirl.define do
  factory :master_product, class: Spree::Product do
    sequence(:name) { |n| "Product ##{n} - #{Kernel.rand(9999)}" }
    # sequence(:name) { |n| "Product ##{n} - #{Kernel.rand(9999)}" }
    description { generate(:random_description) }
    price 19.99
    # cost_price 17.00
    sku { generate(:sku) }
    available_on { 1.year.ago }
    shipping_category { |r| Spree::ShippingCategory.first || r.association(:shipping_category) }
  end
end
