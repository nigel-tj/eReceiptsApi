FactoryGirl.define do
  factory :receipt do
    receipt_number 22113300 #{ FFaker::Receipt.receipt_number }
    header {"Receipt header"}
    footer {"receit footer"}
    user
  end
end
