require_relative './base'

module Services
  module Filter
    class Articles < Base
      def call
        return Article.by_name(params[:name]).all if params[:name]

        []
      end
    end
  end
end
