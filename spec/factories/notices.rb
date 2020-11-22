FactoryBot.define do
  factory :notice do
    user { nil }
    register_book { nil }
    noticed_flag { 1 }
  end
end
