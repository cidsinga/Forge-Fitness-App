class CreateMovements < ActiveRecord::Migration[8.1]
  def change
    create_table :movements do |t|
      t.string :name
      t.text :current_cue
      t.text :progression_rule
      t.text :notes

      t.timestamps
    end
  end
end
