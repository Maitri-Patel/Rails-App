class AddCategoryIdToJokes < ActiveRecord::Migration[7.1]
  def change
    add_reference :jokes, :category, null: false, foreign_key: true
  end
end
