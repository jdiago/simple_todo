class CreateListItem < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :name, null: false, default: ''
      t.belongs_to :todo_list, index: true
    end

    add_foreign_key :list_items, :todo_lists, on_delete: :cascade
  end
end
