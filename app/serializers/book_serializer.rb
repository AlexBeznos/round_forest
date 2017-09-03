class BookSerializer < ApplicationSerializer
  attributes :name, :available, :genres, :authors, :publisher
end
