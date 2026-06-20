class AddTagToMovements < ActiveRecord::Migration[8.1]
  def change
    add_column :movements, :tag, :string
    add_index :movements, :tag, unique: true
  end
end