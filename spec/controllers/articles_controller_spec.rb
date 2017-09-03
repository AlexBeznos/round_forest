require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  include_context 'controller'

  describe '#index' do
    context 'with articles' do
      before do
        create_list :article, 3
        get :index
      end

      it { expect(status).to eq 200 }

      it 'returns all articles' do
        expect(data.count).to eq 3
      end
    end

    context 'without articles' do
      before { get :index }

      it { expect(status).to eq 200 }

      it 'returns empty list' do
        expect(data).to be_empty
      end
    end
  end
end
