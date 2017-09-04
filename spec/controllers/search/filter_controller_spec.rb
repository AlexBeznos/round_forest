require 'rails_helper'

RSpec.describe Search::FilterController, type: :controller do
  include_context 'controller'

  let(:books) { parsed_body['books'] }
  let(:articles) { parsed_body['articles'] }

  describe '#index' do
    before do
      create :book, name: 'ABC'
      create :article, name: 'ABC'
      create :book, genres: 'ABC'
      create :book, authors: 'ABC'
      create :book, publisher: 'ABC'

      create_list :book, 3
      create_list :article, 3
    end

    context 'filter by name' do
      before { get :index, params: { name: 'ABC' } }

      it 'returns only one article and book' do
        expect(books.count).to eq 1
        expect(articles.count).to eq 1
      end
    end

    context 'filter by genre' do
      before { get :index, params: { genre: 'ABC' } }

      it 'returns only one book' do
        expect(books.count).to eq 1
        expect(articles).to be_empty
      end
    end

    context 'filter by author' do
      before { get :index, params: { author: 'ABC' } }

      it 'returns only one book' do
        expect(books.count).to eq 1
        expect(articles).to be_empty
      end
    end

    context 'filter by publisher' do
      before { get :index, params: { publisher: 'ABC' } }

      it 'returns only one book' do
        expect(books.count).to eq 1
        expect(articles).to be_empty
      end
    end
  end
end
