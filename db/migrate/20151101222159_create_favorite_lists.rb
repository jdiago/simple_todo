class CreateFavoriteLists < ActiveRecord::Migration
  def change
    create_table :favorite_lists do |t|
      t.belongs_to :user, index: true
      t.belongs_to :todo_list, index: true

      t.timestamps null: false
    end

    add_index :favorite_lists, [:user_id, :todo_list_id], unique: true
    add_foreign_key :favorite_lists, :users, on_delete: :cascade
    add_foreign_key :favorite_lists, :todo_lists, on_delete: :cascade
  end
end
