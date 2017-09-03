class Books::PrimesController < ApplicationController
  def index
    @books = Book.by_prime_names.all
    render json: @books
  end
end
