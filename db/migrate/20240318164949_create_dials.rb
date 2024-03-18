class CreateDials < ActiveRecord::Migration[7.1]
  def change
    create_table :dials do |t|
      t.string :left
      t.string :right
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
