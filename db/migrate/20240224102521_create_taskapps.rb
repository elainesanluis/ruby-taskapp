class CreateTaskapps < ActiveRecord::Migration[7.1]
  def change
    create_table :taskapps do |t|
      t.string :title
      t.text :description
      t.string :status
      t.date :due_date
      t.string :action

      t.timestamps
    end
  end
end
