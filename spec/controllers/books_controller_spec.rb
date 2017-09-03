require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe '#index' do
    before { create_list(:book, 3) }

    it 'returns all books' do
      get :index

      expect(response.count).to eq 3 
    end
  end
end
