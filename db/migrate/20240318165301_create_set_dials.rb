class CreateSetDials < ActiveRecord::Migration[7.1]
  def change
    create_table :set_dials do |t|
      t.integer :setter_value
      t.string :setter_word
      t.references :dial, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
