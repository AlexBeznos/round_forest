require './app/services/filter/books'
require './app/services/filter/articles'

class Search::FilterController < ApplicationController
  def index
    @books    = Services::Filter::Books.new(params).call
    @articles = Services::Filter::Articles.new(params).call


    render json: {
      books:    ActiveModel::Serializer::CollectionSerializer.new(@books,    each_serializer: BookSerializer),
      articles: ActiveModel::Serializer::CollectionSerializer.new(@articles, each_serializer: ArticleSerializer)
    }
  end
end
