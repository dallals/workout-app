class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :duration_in_min
      t.text :workout_type
      t.date :workout_date
      t.integer :calories_burned
      t.integer :calories_eaten
      t.integer :weight
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
