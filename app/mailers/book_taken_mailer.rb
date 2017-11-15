class BookTakenMailer < ApplicationMailer
  default from: "nikos92@poczta.fm"

  def book_taken_email(user, book)
    @user = user
    @book = book
    mail(to: @user.email, subject: @book.title) do |format|
      format.html
    end
  end
end
