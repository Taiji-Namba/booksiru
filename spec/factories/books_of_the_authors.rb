FactoryBot.define do
  factory :books_of_the_author do
    isbn { "MyString" }
    title { "MyString" }
    sales_date { "MyString" }
    image_url { "MyString" }
    item_url { "MyString" }
    item_price { "MyString" }
    books_genre_id { "MyString" }
    size { "MyString" }
    author_favorite { nil }
  end
end
