class ReservationsHandler
  def initialize(user)
    @user = user
  end

  def take(book)
    return "Books is not available for reservation" unless book.can_be_taken?(user)
    if book.available_reservation.present?
      ::BookReservationExpireWorker.perform_at(book.available_reservation.expires_at-10.seconds, book.available_reservation.book_id)
      book.available_reservation.update_attributes(status: 'TAKEN')
    else
      book.reservations.create(user: user, status: 'TAKEN')
    end.tap {|reservation|
      notify_user_calendar(reservation)
    }
  end

  def give_back(book)
    ActiveRecord::Base.transaction do
      book.reservations.find_by(status: 'TAKEN').update_attributes(status: 'RETURNED')
      book.next_in_queue.update_attributes(status: 'AVAILABLE') if next_in_queue(book).present?
    end
  end

  def reserve(book)
    return unless book.can_reserve?(user)
    book.reservations.create(user: user, status: 'RESERVED')

  end

  def cancel_reservation(book)
    book.reservations.where(user: user, status: 'RESERVED').order(created_at: :asc).first.update_attributes(status: 'CANCELED')
  end


  private
  attr_reader :user
  
  def notify_user_calendar(reservation)
    UserCalendarNotifier.new(reservation.user).perform(reservation)
  end


  def next_in_queue(book)
    book.reservations.where(status: 'RESERVED').order(created_at: :asc).first
  end
end