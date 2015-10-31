class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :name, null: false, default: ''
      t.boolean :is_private, null: false, default: false
      t.belongs_to :user, index: true

      t.timestamps null: false
    end

    add_foreign_key :todo_lists, :users, on_delete: :cascade
  end
end
