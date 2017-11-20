require "rails_helper"

RSpec.describe 'routes to the books resources', type: :routing do
  it { expect(get: '/').to route_to('books#index') }
  it { expect(get: '/books').to route_to('books#index') }
  it { expect(post: '/books').to route_to('books#create') }
  it { expect(get: '/books/new').to route_to('books#new') }
  it { expect(get: '/books/100').to route_to('books#show', id: '100') }
  it { expect(patch: '/books/19').to route_to('books#update', id: '19') }
  it { expect(put: '/books/89').to route_to('books#update', id: '89') }
end