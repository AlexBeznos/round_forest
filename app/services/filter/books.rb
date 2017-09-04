require_relative './base'

module Services
  module Filter
    class Books < Base
      def call
        ds = Book.by_name(params[:name])                   if params[:name]
        ds = (ds || Book).by_genre(params[:genre])         if params[:genre]
        ds = (ds || Book).by_author(params[:author])       if params[:author]
        ds = (ds || Book).by_publisher(params[:publisher]) if params[:publisher]

        ds ? ds.all : []
      end
    end
  end
end
