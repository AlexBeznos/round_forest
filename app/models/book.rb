class Book < ApplicationRecord
  def self.by_prime_names
    where(name_size_prime: true)
  end
end
