class CreateAddress < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.text :description
      t.text :street
      t.text :city
      t.text :state
      t.integer :zip_code

      t.timestamps null: false
      t.references :student, foreign_key: true
    end
  end
end
