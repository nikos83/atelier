namespace :reservation_reminder do
	desc "Remind people to return books"
	task reservations_hanlder: :environment do
		reservations = Reservation.where("status = 'TAKEN' AND expires_at = ?", Date.tomorrow)
		reservations.each do |reservation|
		book = reservation.book
		BookNotifierMailer.book_return_remind(@book).deliver
    BookNotifierMailer.book_reserved_return(@book).deliver
		end
	end
end