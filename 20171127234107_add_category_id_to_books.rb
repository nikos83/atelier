class AddCategoryIdToBooks < ActiveRecord::Migration[5.1]
   add_reference :books, :category, index: true
end
