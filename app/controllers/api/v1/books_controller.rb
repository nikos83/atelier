
module Api
  module V1
    class BooksController < ::Api::V1::BaseController
      def lookup
        render json: books
      end

      private

      def books
        Book.all.map do |book|
          book.attributes.slice('title', 'isbn')
            .symbolize_keys
        end
      end
    end
  end
end