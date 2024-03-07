class AddCategoryIdToTaskapps < ActiveRecord::Migration[7.1]
  def change
    add_reference :taskapps, :category, null: false, foreign_key: true
  end
end
