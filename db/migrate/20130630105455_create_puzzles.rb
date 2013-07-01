class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|
      t.string :title
      t.text :question
      t.text :solution
      t.string :difficulty

      t.timestamps
    end
  end
end
