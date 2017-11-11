class BookTakenMailer < ApplicationMailer
  default from: "nikos92@poczta.fm"

  def book_taken_email(user)
    @user = user
    mail(to: @user.email, subject: 'Confirmation emial')
  end
end
