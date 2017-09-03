require 'rails_helper'

RSpec.describe Books::PrimesController, type: :controller do
  include_context 'controller'

  describe '#index' do
    before do
      create :book, name: 'A'
      create :book, name: 'AB'
      create :book, name: 'ABC'
      create :book, name: 'ABCD'

      get :index
    end

    it { expect(status).to eq 200 }

    it 'returns books only with prime names' do
      names = data.map { |d| d['attributes']['name'] }

      expect(data.count).to eq 2
      expect(names).to match_array(%w[AB ABC])
    end
  end
end
