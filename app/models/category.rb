# app/models/category.rb
class Category < ActiveYaml::Base
  set_root_path "db/data"

  def books
    ::Book.where(category_id: self.id)
  end
   def similar_books
    ::Book.where(category_id: similar_ids)
  end

  private

  def similar_ids
    similar_categories.map { |name| Category.find_by(name: name).id }
  end
end
