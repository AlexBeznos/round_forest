require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  include_context 'controller'

  describe '#index' do
    context 'with books' do
      before do
        create_list :book, 3
        get :index
      end

      it { expect(status).to eq 200 }

      it 'returns all books' do
        expect(data.count).to eq 3
      end
    end

    context 'without books' do
      before { get :index }

      it { expect(status).to eq 200 }

      it 'returns empty list' do
        expect(data).to be_empty
      end
    end
  end
end
