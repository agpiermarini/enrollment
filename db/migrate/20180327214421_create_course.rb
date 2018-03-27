class CreateCourse < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.timestamps null: false
    end
  end
end
