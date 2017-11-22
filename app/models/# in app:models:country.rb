# in app/models/country.rb
class Country < ActiveHash::Base
  self.data = [
    {:id => 1, :name => "US"},
    {:id => 2, :name => "Canada"}
  ]
end

# in some view
<%= collection_select :person, :country_id, Country.all, :id, :name %>
db/data/categories.yml