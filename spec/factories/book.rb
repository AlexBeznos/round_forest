FactoryGirl.define do
  factory :book do
    name      { FFaker::Name.name }
    available { [true, false].sample }
    genres    { FFaker::Book.genre }
    authors   { FFaker::Book.author }
    publisher { FFaker::Name.name }
  end
end
