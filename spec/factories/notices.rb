FactoryBot.define do
  factory :notice do
    user { nil }
    favored_author_book { nil }
    notice_flag { 0 }
  end
end
