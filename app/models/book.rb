class Book < ApplicationRecord
  def self.by_prime_names
    where(name_size_prime: true)
  end

  def self.by_name(name)
    where(name: name)
  end

  def self.by_genre(genre)
    where(genres: genre)
  end

  def self.by_author(author)
    where(authors: author)
  end

  def self.by_publisher(publisher)
    where(publisher: publisher)
  end
end
