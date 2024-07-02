class CreateSolutions < ActiveRecord::Migration[7.1]
  def change
    create_table :solutions do |t|
      t.references :party, null: false, foreign_key: true
      t.string :word
      t.integer :score

      t.timestamps
    end
  end
end
