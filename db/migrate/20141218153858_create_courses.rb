class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :department, index: true
      t.string :name

      t.timestamps
    end
  end
end
