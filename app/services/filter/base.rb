module Services
  module Filter
    class Base
      def initialize(params)
        @params = params
      end

      private

      attr_reader :params
    end
  end
end
