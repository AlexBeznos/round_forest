class AddIsPrimeToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :name_size_prime, :boolean, default: false
  end
end
