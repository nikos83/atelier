require "rails_helper"

RSpec.describe 'routes to the google_books resources', type: :routing do
  it { expect(get: '/google-isbn').to route_to('google_books#show') }
end