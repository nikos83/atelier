class GivenBackPolicy
  def initialize(user:, book:)
    @user = user
    @book = book
  end

  def applies?
    book.reservations.find_by(user: user, status: 'TAKEN').present?
  end

  private
  attr_reader :user, :book
end