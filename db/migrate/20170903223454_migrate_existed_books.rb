require 'prime'

class MigrateExistedBooks < ActiveRecord::Migration[5.1]
  def up
    ids = []

    Book.select(:id, :name).find_each do |book|
      ids.push(book.id) if Prime.prime?(book.name.size)
    end

    Book.where(id: ids).update_all({ name_size_prime: true })
  end

  def down
    Book.update_all({ name_size_prime: false })
  end
end
