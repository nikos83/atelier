class BookNotifierMailer < ApplicationMailer
  default from: "nikos92@poczta.fm"

  def book_return_remind(book)
    @book = book
    @reservation = book.reservations.find_by(status: "TAKEN")
    @borrower = @reservation.user

    mail(to: @borrower.email, subject: "Upływa termin zwrotu książki #{@book.title}") do |format|
      format.html
    end
  end
  
  def book_reserved_return(book)
    @book = book
    @reservation = book.reservations.find_by(status: "RESERVED")
    return "Nie ma nikogo w kolejce" unless @reservation 
       return "Nie ma oczeującej osoby" unless @next_borrower
       @next_borrower = @reservation.user
       mail(to: @next_borrower.email, subject: "Upływa termin zwrotu książki #{@book.title}") do |format|
      format.html
    
    end
  end
  
end
