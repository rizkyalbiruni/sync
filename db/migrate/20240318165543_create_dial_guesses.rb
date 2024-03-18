class CreateDialGuesses < ActiveRecord::Migration[7.1]
  def change
    create_table :dial_guesses do |t|
      t.integer :points
      t.integer :guessed_value
      t.references :set_dial, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
