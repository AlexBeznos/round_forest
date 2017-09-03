FactoryGirl.define do
  factory :article do
    name      { FFaker::Name.name }
    body      { FFaker::Lorem.paragraph }
    genres    { FFaker::Book.genre }
    authors   { FFaker::Book.author }
  end
end
