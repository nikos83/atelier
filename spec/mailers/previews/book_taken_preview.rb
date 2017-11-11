# Preview all emails at http://localhost:3000/rails/mailers/book_taken
class BookTakenPreview < ActionMailer::Preview
    def book_taken_email_preview
        BookTakenMailer.book_taken_email(User.first)
    end
end
