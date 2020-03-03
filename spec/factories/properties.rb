FactoryBot.define do
  factory :property do
    type { "" }
    title { "MyString" }
    address { "MyString" }
    map { "MyString" }
    pictures { "MyString" }
    user { nil }
  end
end
