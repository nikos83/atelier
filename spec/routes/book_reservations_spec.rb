require "rails_helper"

RSpec.describe 'routes to the books resources', type: :routing do
  it { expect(get: '/books/1/reserve').to route_to('reservations#reserve', book_id: '1') }
  it { expect(get: '/books/1/take').to route_to('reservations#take', book_id: '1') }
  it { expect(get: '/books/1/give_back').to route_to('reservations#give_back', book_id: '1') }
  it { expect(get: '/users/1/reservations').to route_to('reservations#users_reservations', user_id: '1') }
end