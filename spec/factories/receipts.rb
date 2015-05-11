FactoryGirl.define do
  factory :receipt do
    receipt_number { FFaker::Receipt.receipt_number }
    header {"Receipt header"}
    footer {"receit footer"}
    user_id 1
  end
end
