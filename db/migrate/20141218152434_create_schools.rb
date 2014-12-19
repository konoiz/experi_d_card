class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :en
      t.string :short

      #t.timestamps
    end
  end
end
