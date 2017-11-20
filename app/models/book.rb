class Book < ApplicationRecord
  has_many :reservations
  has_many :borrowers, through: :reservations, source: :user
  belongs_to :category
  validates :title, :category_name, presence: true
  # statuses: AVAILABLE, TAKEN, RESERVED, EXPIRED, CANCELED, RETURNED

  def category_name
    category.try(:name)
  end

  def category_name=(name)
    self.category = Category.create(name: name)
  end

  def can_be_taken?(user)
    not_taken? && ( available_for_user?(user) || reservations.empty? )
  end

 

  def can_be_given_back?(user)
    reservations.find_by(user: user, status: 'TAKEN').present?
  end



  def can_reserve?(user)
    reservations.find_by(user: user, status: 'RESERVED').nil?
  end



  def cancel_reservation(user)
    reservations.where(user: user, status: 'RESERVED').order(created_at: :asc).first.update_attributes(status: 'CANCELED')
  end



  def not_taken?
    reservations.find_by(status: 'TAKEN').nil?
  end

  def available_for_user?(user)
    if available_reservation.present?
      available_reservation.user == user
    else
      pending_reservations.nil?
    end
  end

  def pending_reservations
    reservations.find_by(status: 'PENDING')
  end

  def available_reservation
    reservations.find_by(status: 'AVAILABLE')
  end
  private

end
