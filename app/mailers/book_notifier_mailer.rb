class BookNotifierMailer < ApplicationMailer
  default from: "nikos92@poczta.fm"

  def book_return_remind(user, book)
    @user = user
    @book = book
    mail(to: @user.email, subject: @book.title) do |format|
      format.html
    end
  end
  def book_available_reservation(book)
  end
  
end
