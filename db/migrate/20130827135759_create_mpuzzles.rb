class CreateMpuzzles < ActiveRecord::Migration
  def change
    create_table :mpuzzles do |t|
      t.string :title
      t.text :question
      t.text :solution
      t.text :hint
      t.string :difficulty
      t.string :image_url

      t.timestamps
    end
  end
end
