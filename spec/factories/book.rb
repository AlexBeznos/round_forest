require 'prime'

FactoryGirl.define do
  factory :book do
    name      { FFaker::Name.name }
    available { [true, false].sample }
    genres    { FFaker::Book.genre }
    authors   { FFaker::Book.author }
    publisher { FFaker::Name.name }

    after(:build) { |book| book.name_size_prime = Prime.prime?(book.name.size) }
  end
end
