class BookNotifierMailer < ApplicationMailer
  default from: "nikos92@poczta.fm"

  def book_return_remind(book)
    @book = book
    @reservation = reservations.find_by(status: "TAKEN")
    @borrower = @reservation.user

    mail(to: @borrower.email, subject: "Upływa termin zwrotu książki #{@book.title}") do |format|
      format.html
    end
  end
  
  def book_available_reservation(book)
    @book = book
    @reservation = reservations.find_by(status: "RESERVED")
    @borrower = @reservation.user
     mail(to: @borrower.email, subject: "Upływa termin zwrotu książki #{@book.title}") do |format|
      format.html
    end
  end
  
end
