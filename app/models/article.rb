class Article < ApplicationRecord
  def self.by_name(name)
    where(name: name)
  end
end
